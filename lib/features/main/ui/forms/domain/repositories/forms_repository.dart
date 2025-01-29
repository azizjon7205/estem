import '/shared/models/survey.dart';

abstract class FormsRepository {
  Future<List<Survey>> getUserSurveys(String state);
}