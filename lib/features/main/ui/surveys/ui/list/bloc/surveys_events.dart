
import '../../../domain/entities/filter_params.dart';

abstract class SurveysEvent {}

class OnLoadSurveys extends SurveysEvent {
  FilterParams params;

  OnLoadSurveys(this.params);
}

class OnToggleBookmark extends SurveysEvent {
  dynamic id;

  OnToggleBookmark(this.id);
}