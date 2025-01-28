import '/shared/models/survey.dart';
import '../../domain/repositories/survey_pass_repository.dart';
import '../remote/survey_pass_api.dart';

class SurveyPassRepositoryImpl extends SurveyPassRepository {
  final SurveyPassApi _api;

  SurveyPassRepositoryImpl(this._api);

  @override
  Future<Survey> getSurvey(id) {
    return _api.getSurvey(id);
  }
}
