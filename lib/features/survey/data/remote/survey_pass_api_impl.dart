import '/core/network/api_service.dart';
import '/shared/models/survey.dart';
import 'survey_pass_api.dart';

class SurveyPassApiImpl extends SurveyPassApi {
  final ApiService _network;

  SurveyPassApiImpl(this._network);

  @override
  Future<Survey> getSurvey(id) {
    // TODO: implement getSurvey
    throw UnimplementedError();
  }
}
