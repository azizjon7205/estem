import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/helper/helper.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/features/main/ui/wallet/ui/transfer/bloc/transfer_event.dart';
import 'package:estem/shared/widgets/app_elevated_button.dart';
import 'package:estem/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../bloc/transfer_bloc.dart';
import '../bloc/transfer_state.dart';
import 'item_card.dart';
import 'item_wallet.dart';

class TransferBody extends StatefulWidget {
  const TransferBody({super.key});

  @override
  State<TransferBody> createState() => _TransferBodyState();
}

class _TransferBodyState extends State<TransferBody>
    with TickerProviderStateMixin {
  final double address1Top = 20;
  final double address2Top = 160;

  late Animation<double> addressAnimation;
  late AnimationController controller;
  final TextEditingController amountCT = TextEditingController();

  animationListener() => setState(() {});

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // Initialize animations
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    addressAnimation = Tween(
            begin: context.read<TransferBloc>().state.type == TransferType.topUp
                ? (address2Top - address1Top)
                : 0.0,
            end: address2Top - address1Top)
        .animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOut)))
      ..addListener(animationListener);
  }

  @override
  dispose() {
    // Dispose of animation controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tweenValue = addressAnimation.value;

    return BlocConsumer<TransferBloc, TransferState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: Text(
                  state.type == TransferType.topUp
                      ? 'transfer.top_up_balance'.tr()
                      : 'transfer.transfer_to_card'.tr(),
                  style: GoogleFonts.inter(
                    color: AppColors.textStrong,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: double.infinity,
                  ),
                  Positioned(
                    top: address1Top + tweenValue,
                    left: 24,
                    right: 24,
                    child: ItemWallet(wallet: state.wallet),
                  ),
                  Positioned(
                    top: 122,
                    left: 24,
                    child: Text(
                      'transfer.my_card'.tr(),
                      style: GoogleFonts.inter(
                          color: AppColors.textStrong,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          height: 34 / 16),
                    ),
                  ),
                  Positioned(
                    top: address2Top - tweenValue,
                    left: 24,
                    right: 24,
                    child: ItemCard(card: state.card, onTap: () {
                      if (state.card != null) {

                      } else {
                        if (state.cards?.isNotEmpty == true) {

                        } else {
                          navController.push(const AddCardRoute());
                        }
                      }
                    },),
                  ),
                  Positioned(
                    top: 85,
                    child: SizedBox(
                      width: 36,
                      height: 36,
                      child: FloatingActionButton(
                        onPressed: () {
                          state.type == TransferType.withdraw
                              ? controller.forward()
                              : controller.reverse();
                          context.read<TransferBloc>().add(OnSwapTransfer());
                        },
                        backgroundColor: AppColors.primary,
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.swap_vert,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 24,
                    right: 24,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextField(
                          controller: amountCT,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CurrencyTextInputFormatter.currency(
                                locale: 'uz', decimalDigits: 0, symbol: ''),
                          ],
                          onChanged: (value) {
                            context.read<TransferBloc>().add(
                                OnAmountChanged(double.tryParse(value) ?? 0.0));
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          hint: 'transfer.amount_hint'.tr(),
                          suffix: GestureDetector(
                            onTap: () {
                              amountCT.text = Helper.formatCurrency(
                                  state.type == TransferType.withdraw
                                      ? state.wallet.balance
                                      : (state.card?.balance ?? 0.0));
                              context.read<TransferBloc>().add(OnAmountChanged(
                                  state.type == TransferType.withdraw
                                      ? state.wallet.balance
                                      : (state.card?.balance ?? 0.0)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset(
                                  'assets/icons/ic_magnet.svg'),
                            ),
                          ),
                        ),
                        if ((state.minimumAmount ?? 0.0) != 0.0)
                          Text(
                            'transfer.minimal_prompt'.tr(args: [
                              '${Helper.formatCurrency(state.minimumAmount!)} uzs'
                            ]),
                            style: GoogleFonts.inter(
                              color: const Color(0xFF747688),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                      ],
                    ),
                  ),
                  Positioned(
                      left: 52,
                      right: 52,
                      bottom: 36,
                      child: AppElevatedButton(
                        enabled: false,
                        label: 'base.actions.continue'.tr().toUpperCase(),
                      ))
                ],
              ),
              extendBody: true,
            ),
        listener: (context, state) {});
  }
}
