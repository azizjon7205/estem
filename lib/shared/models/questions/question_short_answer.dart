import '../question.dart';

class ShortAnswerQuestion extends Question {
  ShortAnswerQuestion({
    super.id,
    required super.question,
    super.image,
    required super.isRequired,
  });

  @override
  Question copyWith({
    dynamic id,
    String? question,
    String? image,
    bool? isRequired,
  }) {
    return ShortAnswerQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
    );
  }

  @override
  QuestionType get questionType => QuestionType.shortAnswer;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": question,
      "photo": image,
      "required": isRequired,
      "type": questionType.type
    };
  }

  factory ShortAnswerQuestion.fromJson(Map<String, dynamic> json) {
    return ShortAnswerQuestion(
      id: json['id'],
      image: json['photo'],
      question: json['title'],
      isRequired: json['required'],
    );
  }
}
