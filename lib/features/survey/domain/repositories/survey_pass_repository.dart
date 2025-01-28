import '/shared/models/survey.dart';

abstract class SurveyPassRepository {
  Future<Survey> getSurvey(dynamic id);
}