import '/shared/models/survey.dart';

class StartSurveyState {
  Survey? survey;
  bool isFromPreview;

  StartSurveyState({
    this.survey,
    this.isFromPreview = false,
  });

  StartSurveyState copyWith({
    Survey? survey,
    bool? isFromPreview,
}) {
    return StartSurveyState(
      survey: survey ?? this.survey,
      isFromPreview: isFromPreview ?? this.isFromPreview
    );
  }
}
