import '/shared/models/survey.dart';
import '../../domain/entities/filter_attributes.dart';
import '../../domain/entities/filter_params.dart';
import '../../domain/repositories/filter_repository.dart';
import '../remote/filter_api.dart';

class FilterRepositoryImpl extends FilterRepository {
  final FilterApi _api;

  FilterRepositoryImpl(this._api);

  @override
  Future<FilterAttributes> getFilterAttributes() {
    return _api.getFilterAttributes();
  }

  @override
  Future<List<Survey>> getSurveys(FilterParams params) {
    return _api.getSurveys(params);
  }
}
