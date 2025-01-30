import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/router/router.gr.dart';
import '../../../../../../../shared/widgets/sizes.dart';
import '../../../../../../../shared/widgets/survey_item.dart';
import '../bloc/surveys_bloc.dart';

class SurveysBody extends StatelessWidget {
  const SurveysBody({super.key});

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<SurveysBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'surveys'.tr(),
          style: GoogleFonts.inter(
            color: AppColors.textStrong,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: watcher.state.isLoading
          ? const Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              itemBuilder: (context, i) {
                final survey = watcher.state.surveys[i];
                return SurveyItem(
                  onTap: () {
                    navController.push(StartSurveyRoute(
                      survey: survey,
                      onStartSurvey: () {
                        navController.push(SurveyRoute(
                          id: survey.id,
                          title: survey.title,
                        ));
                      },
                    ));
                  },
                  survey: survey,
                  isSavedBookmark: false,
                  onSurveySavedBookmark: (value) {},
                );
              },
              separatorBuilder: (context, i) => const Height(8.0),
              itemCount: watcher.state.surveys.length,
            ),
    );
  }
}
