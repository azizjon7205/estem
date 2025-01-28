import '../../domain/entities/survey_params.dart';
import '../../domain/repositories/survey_repository.dart';
import '../remote/survey_api.dart';

class SurveyRepositoryImpl extends SurveyRepository {
  final SurveyApi _api;

  SurveyRepositoryImpl(this._api);

  @override
  Future<SurveyParams> getSurveyQuestions(id) {
    // TODO: implement getSurveyQuestions
    throw UnimplementedError();
  }

  @override
  Future<String> submitSurveyQuestions(SurveyParams params) {
    // TODO: implement saveSurveyQuestions
    throw UnimplementedError();
  }

  @override
  Future<String> saveSurveyToDraft(SurveyParams params) {
    // TODO: implement saveSurveyToDraft
    throw UnimplementedError();
  }
}
