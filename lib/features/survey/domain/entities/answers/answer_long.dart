import '/shared/models/question.dart';
import '../answer.dart';

class LongAnswer extends Answer {
  String? text;

  LongAnswer({this.text, required super.id});

  @override
  Answer copyWith({
    String? text,
  }) {
    return LongAnswer(text: text ?? this.text, id: id);
  }

  @override
  String get key => QuestionType.longAnswer.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "text": text, "key": key};
  }
}
