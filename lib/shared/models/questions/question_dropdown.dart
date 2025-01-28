import '../question.dart';
import 'option.dart';

class DropdownQuestion extends Question {
  List<Option> options;

  DropdownQuestion({
    super.id,
    required super.question,
    super.image,
    required super.isRequired,
    required this.options,
  });

  @override
  Question copyWith({
    dynamic id,
    String? question,
    String? image,
    bool? isRequired,
    List<Option>? options,
  }) {
    return DropdownQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
      options: options ?? this.options,
    );
  }

  @override
  QuestionType get questionType => QuestionType.dropdown;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": question,
      "photo": image,
      "required": isRequired,
      "options": options.map((element) => element.toJson()).toList(),
      "type": questionType.type
    };
  }

  factory DropdownQuestion.fromJson(Map<String, dynamic> json) {
    return DropdownQuestion(
      id: json['id'],
      image: json['photo'],
      question: json['title'],
      isRequired: json['required'],
      options:
          List<Option>.from(json['options'].map((e) => Option.fromJson(e))),
    );
  }
}
