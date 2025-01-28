class UploadFileParams {
  dynamic methodId;
  String type;
  dynamic surveyId;
  dynamic questionId;
  String? path;

  UploadFileParams({
    this.methodId = 11,
    required this.type,
    this.surveyId,
    this.questionId,
    this.path
  });

  UploadFileParams copyWith({
    dynamic methodId,
    String? type,
    dynamic surveyId,
    dynamic questionId,
    String? path,
  }) {
    return UploadFileParams(
      type: type ?? this.type,
      surveyId: surveyId ?? this.surveyId,
      questionId: questionId ?? this.questionId,
      path: path ?? this.path
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "method_id": methodId,
      "type": type,
      "survey_id": surveyId,
      "question_id": questionId
    };
  }
}
