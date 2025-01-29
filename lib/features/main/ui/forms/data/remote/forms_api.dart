import '/shared/models/survey.dart';

abstract class FormsApi {
  Future<List<Survey>> getSurveys(String state);
}