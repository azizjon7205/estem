import '/shared/models/survey.dart';

abstract class SurveyPassApi {
  Future<Survey> getSurvey(dynamic id);


}