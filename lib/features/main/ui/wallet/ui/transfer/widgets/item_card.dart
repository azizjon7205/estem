import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/app_container.dart';
import '../../../domain/entities/wallet_card.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, this.card, this.suffix, this.onTap});

  final WalletCard? card;
  final Widget? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: AppContainer(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: card != null
            ? Row(
                spacing: 16.0,
                children: [
                  SvgPicture.asset('assets/icons/ic_logo_1.svg'),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card!.cardName,
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            height: 18.0 / 14.0,
                          ),
                        ),
                        Text(
                          card!.cardNumber ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (suffix != null) suffix!
                ],
              )
            : SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16.0,
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.primary,
                      size: 14,
                    ),
                    Text(
                      'transfer.add_card'.tr(),
                      style: GoogleFonts.inter(
                        color: AppColors.primary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        height: 18.0 / 14,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
