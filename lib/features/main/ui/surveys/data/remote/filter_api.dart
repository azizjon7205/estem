
import '/shared/models/survey.dart';
import '../../domain/entities/filter_attributes.dart';
import '../../domain/entities/filter_params.dart';

abstract class FilterApi {
  Future<FilterAttributes> getFilterAttributes();

  Future<List<Survey>> getSurveys(FilterParams params);
}