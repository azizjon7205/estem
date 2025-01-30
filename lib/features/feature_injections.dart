import 'auth/injections.dart';
import 'create_survey/injections.dart';
import 'main/injections.dart';
import 'main/ui/surveys/injections.dart';
import 'main/ui/forms/injections.dart';
import 'main/ui/home/injections.dart';
import 'survey/injections.dart';

void initFeatureInjections() {
  initAuthInjections();
  initMainInjections();
  initFilterInjections();
  initHomeInjections();
  initFormsInjections();
  initCreateSurveyInjections();
  initSurveyInjections();
}
