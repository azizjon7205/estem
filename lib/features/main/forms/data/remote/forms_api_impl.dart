import '/core/network/api_service.dart';
import '/shared/models/survey.dart';
import 'forms_api.dart';

class FormsApiImpl extends FormsApi {
  final ApiService _network;

  FormsApiImpl(this._network);

  @override
  Future<List<Survey>> getSurveys(String state) async {
    return await _network.post<List<Survey>>(
      '/api/app/function/run',
      data: {"method_id": 2, "state": state},
      tFromJson: (json) => List<Survey>.from(
        json.map((e) => Survey.formJson(e)),
      ),
    );
  }
}
