import '/shared/models/survey.dart';
import '../../domain/entities/filter_attributes.dart';
import '../../domain/entities/filter_params.dart';
import '/core/network/api_service.dart';
import 'filter_api.dart';

class FilterApiImpl extends FilterApi {
  final ApiService _network;

  FilterApiImpl(this._network);

  @override
  Future<FilterAttributes> getFilterAttributes() {
    return _network.get(
      'api/app/get_info',
      queryParameters: {"methodId": 6},
      tFromJson: FilterAttributes.fromJson,
    );
  }

  @override
  Future<List<Survey>> getSurveys(FilterParams params) {
    return _network.get(
      'api/app/get_info',
      queryParameters: params.toJson(),
      tFromJson: (json) => List<Survey>.of(json['surveys'].map(
        (e) => Survey.fromJson(e),
      )),
    );
  }
}
