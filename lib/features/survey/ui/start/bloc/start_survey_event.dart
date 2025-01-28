import '/shared/models/survey.dart';

abstract class StartSurveyEvent {}

class OnLoadSurvey extends StartSurveyEvent {
  Survey survey;
  bool isPreview;

  OnLoadSurvey({required this.survey, this.isPreview = false});
}

class OnFetchSurvey extends StartSurveyEvent {
  dynamic id;
  bool isPreview;

  OnFetchSurvey({
    this.id,
    this.isPreview = false,
  });
}
