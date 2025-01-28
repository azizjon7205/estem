import '../question.dart';

class ScaleQuestion extends Question {
  String? leftLabel;
  String? rightLabel;
  int leftScale;
  int rightScale;

  ScaleQuestion({
    super.id,
    required super.question,
    super.image,
    required super.isRequired,
    this.leftLabel,
    this.rightLabel,
    this.leftScale = 1,
    required this.rightScale,
  });

  @override
  Question copyWith({
    dynamic id,
    String? question,
    String? image,
    bool? isRequired,
    String? leftLabel,
    String? rightLabel,
    int? rightScale,
  }) {
    return ScaleQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
      leftLabel: leftLabel ?? this.leftLabel,
      rightLabel: rightLabel ?? this.rightLabel,
      rightScale: rightScale ?? this.rightScale,
    );
  }

  @override
  QuestionType get questionType => QuestionType.linearScale;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "question": question,
      "image": image,
      "is_required": isRequired,
      "left_label": leftLabel,
      "right_label": rightLabel,
      "right_scale": rightScale,
      "key": questionType.type
    };
  }

  factory ScaleQuestion.fromJson(Map<String, dynamic> json) {
    return ScaleQuestion(
      id: json['id'],
      question: json['title'],
      image: json['photo'],
      isRequired: json['required'],
      rightScale: json['right_scale'],
      rightLabel: json['right_label'],
      leftLabel: json['right_label'],
    );
  }
}
