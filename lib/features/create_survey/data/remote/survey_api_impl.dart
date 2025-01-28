
import '../../domain/entities/survey_params.dart';
import '/core/network/api_service.dart';

import 'survey_api.dart';

class SurveyApiImpl extends SurveyApi {
  final ApiService _network;

  SurveyApiImpl(this._network);

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