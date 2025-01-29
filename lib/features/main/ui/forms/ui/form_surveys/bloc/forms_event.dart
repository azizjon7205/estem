abstract class FormsEvent {}

class LoadUserSurveys extends FormsEvent {
  String tab;

  LoadUserSurveys(this.tab);
}


