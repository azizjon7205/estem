import 'auth/injections.dart';
import 'create_survey/injections.dart';
import 'main/forms/injections.dart';
import 'main/home/injections.dart';
import 'survey/injections.dart';

void initFeatureInjections() {
  initAuthInjections();
  initHomeInjections();
  initFormsInjections();
  initCreateSurveyInjections();
  initSurveyInjections();
}
