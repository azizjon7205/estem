import '../entities/home_surveys.dart';

abstract class HomeSurveysRepository {
  Future<HomeSurveys> getHomeSurveys();
}
