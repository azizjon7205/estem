import '/shared/models/question.dart';

class QuestionEntity {
  dynamic id;
  Question question;
  String? additionalLabel;
  String? error;

  QuestionEntity({
    this.id,
    required this.question,
    this.additionalLabel,
    this.error,
  });

  QuestionEntity copyWith({
    dynamic id,
    Question? question,
    String? additionalLabel,
    String? error,
  }) {
    return QuestionEntity(
      id: id ?? this.id,
      question: question ?? this.question,
      additionalLabel: additionalLabel ?? this.additionalLabel,
      error: error ?? this.error,
    );
  }
}
