import 'package:estem/features/survey/domain/entities/answer.dart';
import 'package:estem/shared/models/question.dart';

abstract class SurveyEvent {}

class OnSubmit extends SurveyEvent {}

class OnLoadQuestions extends SurveyEvent {
  final dynamic id;

  OnLoadQuestions(this.id);
}

class OnLoadPreviewQuestions extends SurveyEvent {
  final List<Question> questions;

  OnLoadPreviewQuestions(this.questions);
}

class OnAnswerChanged extends SurveyEvent {
  final Answer answer;

  OnAnswerChanged(this.answer);
}

class OnUploadFile extends SurveyEvent {
  final Answer answer;

  OnUploadFile(this.answer);
}

class OnUploadFileTemporary extends SurveyEvent {
  final Answer answer;

  OnUploadFileTemporary(this.answer);
}
class OnRemoveFile extends SurveyEvent {
  final Answer answer;

  OnRemoveFile(this.answer);
}