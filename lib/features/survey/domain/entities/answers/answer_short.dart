import '/shared/models/question.dart';
import '../answer.dart';

class ShortAnswer extends Answer {
  String? text;

  ShortAnswer({required super.id, this.text});

  @override
  Answer copyWith({
    String? text,
  }) {
    return ShortAnswer(id: id, text: text ?? this.text);
  }

  @override
  String get key => QuestionType.shortAnswer.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "text": text, "key": key};
  }
}
