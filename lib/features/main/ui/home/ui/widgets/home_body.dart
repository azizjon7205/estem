import 'package:easy_localization/easy_localization.dart';
import 'package:estem/features/main/ui/home/ui/bloc/home_event.dart';
import 'package:estem/features/main/ui/home/ui/widgets/content_surveys.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../../../bloc/main_bloc.dart';
import '../../../surveys/domain/entities/filter_params.dart';
import '/core/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '../bloc/home_bloc.dart';
import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';
import '/shared/widgets/survey_item.dart';
import 'card_category_home.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeBloc>();
    final mainCT = context.watch<MainBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([context.read<MainBloc>().firstItemKey]);
    });
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 99,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(33),
                  bottomRight: Radius.circular(33),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  spacing: 8.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Width(24),
                    Text(
                      controller.state.isBalanceVisible
                          ? '${Helper.formatCurrency(mainCT.state.user?.balance ?? 0.0)} uzs'
                          : '${Helper.obscureDigits(Helper.formatCurrency(mainCT.state.user?.balance ?? 0.0))} uzs',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 24.0,
                        height: 34 / 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(OnToggleBalanceVisibility());
                      },
                        child: SvgPicture.asset(
                      controller.state.isBalanceVisible ? 'assets/icons/ic_show.svg' : 'assets/icons/ic_hide.svg',
                    ))
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 24,
              right: 24,
              child: Row(
                spacing: 12,
                children: [
                  ...context.watch<HomeBloc>().state.catalogs.map(
                        (e) => Expanded(
                          child: CardCategoryHome(
                            catalog: e,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
        const Height(12),
        const Expanded(
          child: ContentSurveys(),
        ),
      ],
    );
  }
}
