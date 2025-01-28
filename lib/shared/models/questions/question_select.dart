import '../question.dart';
import 'option.dart';

class SelectQuestion extends Question {
  List<Option> options;
  bool hasOther;

  SelectQuestion({
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
    return SelectQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
      options: options ?? this.options,
      hasOther: hasOther ?? this.hasOther,
    );
  }

  @override
  QuestionType get questionType => QuestionType.select;

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

  factory SelectQuestion.fromJson(Map<String, dynamic> json) {
    return SelectQuestion(
      id: json['id'],
      image: json['photo'],
      question: json['title'],
      isRequired: json['required'],
      options: json['options'] != null
          ? List<Option>.from(json['options'].map((e) => Option.fromJson(e)))
              .toList()
          : [],
    );
  }
}
