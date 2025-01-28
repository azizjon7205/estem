
import '/shared/models/question.dart';
import '../../domain/entities/question_entity.dart';

abstract class CreateEvent {

}

class OnLoadCategories extends CreateEvent{}

class OnSelectCategory extends CreateEvent {
  final dynamic id;

  OnSelectCategory(this.id);
}

class OnLoadRegions extends CreateEvent{}

class OnSelectRegion extends CreateEvent {
  final dynamic id;

  OnSelectRegion(this.id);
}

class OnTapBrowseImage extends CreateEvent {

}

class OnDeleteImage extends CreateEvent {

  OnDeleteImage();
}

class OnTitleChanged extends CreateEvent {
  String title;

  OnTitleChanged(this.title);
}

class OnDescriptionChanged extends CreateEvent {
  String description;

  OnDescriptionChanged(this.description);
}

class OnDurationChanged extends CreateEvent {
  int? duration;

  OnDurationChanged(this.duration);
}

class OnPriceChanged extends CreateEvent {
  double? price;

  OnPriceChanged(this.price);
}

class OnPageChanged extends CreateEvent {
  int page;

  OnPageChanged(this.page);
}

class OnQuestionRequiredChanged extends CreateEvent {
  dynamic id;
  bool required;

  OnQuestionRequiredChanged(this.id, this.required);
}

class OnAddQuestion extends CreateEvent {
  final QuestionEntity questionEntity;

  OnAddQuestion(this.questionEntity);
}

class OnAddTempQuestion extends CreateEvent {
  final Question question;

  OnAddTempQuestion(this.question);
}

class OnDeleteQuestion extends CreateEvent {
  final dynamic id;

  OnDeleteQuestion(this.id);
}

class OnDuplicateQuestion extends CreateEvent {
  final dynamic id;

  OnDuplicateQuestion(this.id);
}

class OnQuestionChanged extends CreateEvent {
  QuestionEntity question;

  OnQuestionChanged(this.question);
}

class OnQuestionTappedToChange extends CreateEvent {
  final QuestionEntity question;

  OnQuestionTappedToChange(this.question);
}

class OnTempQuestionChanged extends CreateEvent {
  final QuestionEntity entity;

  OnTempQuestionChanged(this.entity);
}

class OnSubmitSurvey extends CreateEvent {}

class OnSaveToDraft extends CreateEvent {}

class OnLoadSurveyToEdit extends CreateEvent {
  dynamic id;

  OnLoadSurveyToEdit(this.id);
}