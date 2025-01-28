import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/router/router.dart';
import '/core/styles/app_colors.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/sizes.dart';
import '../bloc/start_survey_bloc.dart';
import '../bloc/start_survey_state.dart';

class StartSurveyContent extends StatelessWidget {
  const StartSurveyContent({super.key, this.onStartSurvey});

  final VoidCallback? onStartSurvey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartSurveyBloc, StartSurveyState>(
        builder: (context, state) => state.survey != null
            ? Stack(
                children: [
                  Image.network(
                    state.survey!.image,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned(
                    // alignment: Alignment.topRight,
                    top: 53,
                    right: 24,
                    child: IconButton(
                      onPressed: () {
                        navController.maybePop();
                      },
                      splashRadius: 8.0,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.4),
                      ),
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.textStrong,
                        size: 22,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 24.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.7),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.survey!.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              color: AppColors.textStrong,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              height: 48.41 / 40,
                            ),
                          ),
                          const Height(4.0),
                          Text(
                            state.survey!.description,
                            style: GoogleFonts.inter(
                              color: const Color(0xFF888693),
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Height(16.0),
                          Row(
                            spacing: 2.0,
                            children: [
                              const Icon(
                                Icons.watch_later,
                                color: AppColors.secondary,
                                size: 20,
                              ),
                              Text(
                                'survey.estimated_time'.tr(
                                    args: ['${state.survey!.duration} min']),
                                style: GoogleFonts.inter(
                                  color: AppColors.textSub,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                          const Height(10.0),
                          Row(
                            spacing: 2.0,
                            children: [
                              const Icon(
                                Icons.account_balance_wallet_rounded,
                                color: AppColors.secondary,
                                size: 20,
                              ),
                              Text(
                                'survey.you_will_earn'
                                    .tr(args: ['${state.survey!.price}uzs']),
                                style: GoogleFonts.inter(
                                  color: AppColors.textSub,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                          const Height(40.0),
                          AppElevatedButton(
                            margin: const EdgeInsets.symmetric(horizontal: 48),
                            label: 'survey.start_survey'.tr(),
                            onTap: onStartSurvey ?? () {
                              navController.push(SurveyRoute(title: state.survey!.title, id: state.survey!.id));
                            },
                          ),
                          if (state.isFromPreview) const Height(24.0)
                        ],
                      ),
                    ),
                  )
                ],
              )
            : const Center(
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              ),
        listener: (context, state) {});
  }
}
