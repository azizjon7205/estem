import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/injections.dart';
import '/shared/models/survey.dart';
import '../bloc/start_survey_bloc.dart';
import '../bloc/start_survey_event.dart';
import '../widgets/start_survey_content.dart';

@RoutePage()
class StartSurveyScreen extends StatelessWidget {
  const StartSurveyScreen({
    super.key,
    this.survey,
    @QueryParam("surveyId") this.id = null,
    this.isFromPreview = false,
    this.onStartSurvey,
  });

  final dynamic id;
  final Survey? survey;
  final bool isFromPreview;
  final VoidCallback? onStartSurvey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => StartSurveyBloc(repository: sl())
          ..add(survey != null
              ? OnLoadSurvey(survey: survey!, isPreview: isFromPreview)
              : OnFetchSurvey(id: id, isPreview: isFromPreview)),
        child: StartSurveyContent(
          onStartSurvey: onStartSurvey,
        ),
      ),
    );
  }
}
