import '../question.dart';
import 'option.dart';

class CheckBoxQuestion extends Question {
  List<Option> options;
  bool hasOther;

  CheckBoxQuestion({
    super.id,
    required super.question,
    super.image,
    required super.isRequired,
    required this.options,
    this.hasOther = false,
  });

  @override
  Question copyWith({
    dynamic id,
    String? question,
    String? image,
    bool? isRequired,
    List<Option>? options,
    bool? hasOther,
  }) {
    return CheckBoxQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
      options: options ?? this.options,
      hasOther: hasOther ?? this.hasOther,
    );
  }

  @override
  QuestionType get questionType => QuestionType.checkbox;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": question,
      "photo": image,
      "required": isRequired,
      "has_other": hasOther,
      "options": options.map((element) => element.toJson()).toList(),
      "type": questionType.type
    };
  }

  factory CheckBoxQuestion.fromJson(Map<String, dynamic> json) {
    return CheckBoxQuestion(
      id: json['id'],
      options: json['options'] != null
          ? List<Option>.from(json['options'].map((e) => Option.fromJson(e)))
              .toList()
          : [],
      question: json['title'],
      image: json['photo'],
      isRequired: json['required'],
      hasOther: json['has_other'],
    );
  }
}
