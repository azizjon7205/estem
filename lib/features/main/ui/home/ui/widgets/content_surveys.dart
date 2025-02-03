import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../bloc/main_bloc.dart';
import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';
import '/shared/widgets/survey_item.dart';
import '../../../surveys/domain/entities/filter_params.dart';
import '../bloc/home_bloc.dart';

class ContentSurveys extends StatelessWidget {
  const ContentSurveys({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeBloc>();
    return ListView(
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              final survey = controller.state.surveys.recentSurveys[i];
              if (i == 0 && false) {
                return Showcase.withWidget(
                    key: context.read<MainBloc>().firstItemKey,
                    targetBorderRadius: BorderRadius.circular(10),
                    targetShapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    onTargetClick: () {
                      ShowCaseWidget.of(context).dismiss();
                      navController.push(StartSurveyRoute(
                          survey: survey,
                          onStartSurvey: () {
                            navController.push(SurveyRoute(
                              id: survey.id,
                              title: survey.title,
                            ));
                          }));
                    },
                    container: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Image.asset('assets/icons/ic_arrow.png'),
                          SizedBox(
                            width: 220,
                            child: Text('Complete your first survey and earn 5000 sum',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                            ),),
                          )
                        ],
                      ),
                    ),
                    child: SurveyItem(
                      onTap: () {
                        navController.push(StartSurveyRoute(
                            survey: survey,
                            onStartSurvey: () {
                              navController.push(SurveyRoute(
                                id: survey.id,
                                title: survey.title,
                              ));
                            }));
                      },
                      survey: survey,
                      isSavedBookmark: false,
                      onSurveySavedBookmark: (value) {},
                    ));
              }
              return SurveyItem(
                onTap: () {
                  navController.push(StartSurveyRoute(
                      survey: survey,
                      onStartSurvey: () {
                        navController.push(SurveyRoute(
                          id: survey.id,
                          title: survey.title,
                        ));
                      }));
                },
                survey: survey,
                isSavedBookmark: false,
                onSurveySavedBookmark: (value) {},
              );
            },
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) => SurveyItem(
              onTap: () {
                navController.push(StartSurveyRoute(
                    survey: controller.state.surveys.recommendedSurveys[i],
                    onStartSurvey: () {
                      navController.push(SurveyRoute(
                        id: controller.state.surveys.recommendedSurveys[i].id,
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
    );
  }
}
