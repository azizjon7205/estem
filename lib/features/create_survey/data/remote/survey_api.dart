import '../../domain/entities/survey_params.dart';

abstract class SurveyApi {
  Future<String> saveSurveyToDraft(SurveyParams params);

  Future<String> submitSurveyQuestions(SurveyParams params);

  Future<SurveyParams> getSurveyQuestions(dynamic id);

}