
import '/shared/models/survey.dart';
import '../entities/filter_attributes.dart';
import '../entities/filter_params.dart';

abstract class FilterRepository {
  Future<FilterAttributes> getFilterAttributes();

  Future<List<Survey>> getSurveys(FilterParams params);
}