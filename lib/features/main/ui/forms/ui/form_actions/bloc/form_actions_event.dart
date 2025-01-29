abstract class FormActionsEvent{}

class OnStatusChanged extends FormActionsEvent {
  bool status;

  OnStatusChanged(this.status);
}

class OnSurveyEdit extends FormActionsEvent {
  dynamic id;

  OnSurveyEdit(this.id);
}

class OnSurveyDuplicate extends FormActionsEvent {
  dynamic id;

  OnSurveyDuplicate(this.id);
}

class OnSurveyDelete extends FormActionsEvent {
  dynamic id;

  OnSurveyDelete(this.id);
}