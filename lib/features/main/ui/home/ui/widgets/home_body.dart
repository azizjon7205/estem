import 'package:easy_localization/easy_localization.dart';
import 'package:estem/features/main/ui/home/ui/bloc/home_event.dart';
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
        Expanded(
          child: ListView(
            children: [
              if (controller.state.surveys.recentSurveys.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'home.recent'.tr(),
                        style: GoogleFonts.inter(
                            color: AppColors.textStrong,
                            fontSize: 18,
                            height: 34 / 18,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          navController.push(
                            SurveysRoute(params: FilterParams(isRecent: true)),
                          );
                        },
                        child: Row(
                          spacing: 5,
                          children: [
                            Text(
                              'home.see_all'.tr(),
                              style: GoogleFonts.inter(
                                color: AppColors.textSub,
                                fontSize: 14,
                                height: 23 / 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SvgPicture.asset('assets/icons/ic_arrow_right.svg')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) => SurveyItem(
                    onTap: () {
                      navController.push(StartSurveyRoute(
                          survey: controller.state.surveys.recentSurveys[i],
                          onStartSurvey: () {
                            navController.push(SurveyRoute(
                              id: controller.state.surveys.recentSurveys[i].id,
                              title: controller
                                  .state.surveys.recentSurveys[i].title,
                            ));
                          }));
                    },
                    survey: controller.state.surveys.recentSurveys[i],
                    isSavedBookmark: false,
                    onSurveySavedBookmark: (value) {},
                  ),
                  separatorBuilder: (context, i) => const Height(8.0),
                  itemCount: controller.state.surveys.recentSurveys.length,
                ),
              ],
              if (controller.state.surveys.recommendedSurveys.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'home.for_you'.tr(),
                        style: GoogleFonts.inter(
                            color: AppColors.textStrong,
                            fontSize: 18,
                            height: 34 / 18,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          navController.push(
                            SurveysRoute(params: FilterParams(isForYou: true)),
                          );
                        },
                        child: Row(
                          spacing: 5,
                          children: [
                            Text(
                              'home.see_all'.tr(),
                              style: GoogleFonts.inter(
                                color: AppColors.textSub,
                                fontSize: 14,
                                height: 23 / 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SvgPicture.asset('assets/icons/ic_arrow_right.svg')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) => SurveyItem(
                    onTap: () {
                      navController.push(StartSurveyRoute(
                          survey:
                              controller.state.surveys.recommendedSurveys[i],
                          onStartSurvey: () {
                            navController.push(SurveyRoute(
                              id: controller
                                  .state.surveys.recommendedSurveys[i].id,
                              title: controller
                                  .state.surveys.recommendedSurveys[i].title,
                            ));
                          }));
                    },
                    survey: controller.state.surveys.recommendedSurveys[i],
                    isSavedBookmark: false,
                    onSurveySavedBookmark: (value) {},
                  ),
                  separatorBuilder: (context, i) => const Height(8.0),
                  itemCount: controller.state.surveys.recommendedSurveys.length,
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
