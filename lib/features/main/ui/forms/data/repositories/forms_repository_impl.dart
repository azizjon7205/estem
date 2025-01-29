import '/shared/models/survey.dart';
import '../../domain/repositories/forms_repository.dart';
import '../remote/forms_api.dart';

class FormsRepositoryImpl extends FormsRepository {
  final FormsApi _api;

  FormsRepositoryImpl(this._api);

  @override
  Future<List<Survey>> getUserSurveys(String state) {
    return _api.getSurveys(state);
  }
}
