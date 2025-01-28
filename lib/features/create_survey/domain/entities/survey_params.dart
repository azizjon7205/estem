import '/shared/models/questions/question_checkbox.dart';
import '/shared/models/questions/question_date.dart';
import '/shared/models/questions/question_dropdown.dart';
import '/shared/models/questions/question_email.dart';
import '/shared/models/questions/question_long_answer.dart';
import '/shared/models/questions/question_number.dart';
import '/shared/models/questions/question_rating.dart';
import '/shared/models/questions/question_scale.dart';
import '/shared/models/questions/question_select.dart';
import '/shared/models/questions/question_short_answer.dart';
import '/shared/models/questions/question_smile.dart';
import '/shared/models/questions/question_time.dart';
import '/shared/models/questions/question_upload_file.dart';

import '/shared/models/question.dart';

class SurveyParams {
  dynamic id;
  String? title;
  String? description;
  int? duration;
  String? image;
  double? price;
  dynamic categoryId;
  dynamic regionId;
  List<Question> questions;
  int methodId;

  SurveyParams({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.image,
    this.price,
    this.categoryId,
    this.regionId,
    this.questions = const [],
    this.methodId = 8,
  });

  factory SurveyParams.fromJson(Map<String, dynamic> json) {
    return SurveyParams(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        duration: json['duration'],
        price: double.tryParse(json['price']) ?? 0.0,
        categoryId: json['category_id'],
        regionId: json['location'],
        image: json['image'],
        questions: List<Question>.from(json['questions'].map(
          (e) {
            switch(e['type'].toString().question) {
              case QuestionType.shortAnswer:
                return ShortAnswerQuestion.fromJson(e);
              case QuestionType.longAnswer:
                return LongAnswerQuestion.fromJson(e);
              case QuestionType.email:
                return EmailQuestion.fromJson(e);
              case QuestionType.number:
                return NumberQuestion.fromJson(e);
              case QuestionType.select:
                return SelectQuestion.fromJson(e);
              case QuestionType.checkbox:
                return CheckBoxQuestion.fromJson(e);
              case QuestionType.dropdown:
                return DropdownQuestion.fromJson(e);
              case QuestionType.linearScale:
                return ScaleQuestion.fromJson(e);
              case QuestionType.date:
                return DatePickerQuestion.fromJson(e);
              case QuestionType.time:
                return TimePickerQuestion.fromJson(e);
              case QuestionType.fileUpload:
                return UploadFileQuestion.fromJson(e);
              case QuestionType.starRating:
                return StarRatingQuestion.fromJson(e);
              case QuestionType.smile:
                return SmileQuestion.fromJson(e);
            }
          },
        )));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "method_id": id,
      "title": title,
      "description": description,
      "duration": duration,
      "price": price,
      "category_id": categoryId,
      "location": regionId,
      "image": image,
      "questions": questions.map((element) => element.toJson()).toList()
    };
  }
}
