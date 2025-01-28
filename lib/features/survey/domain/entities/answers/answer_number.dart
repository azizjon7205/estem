import '/shared/models/question.dart';
import '../answer.dart';

class NumberAnswer extends Answer {
  String? text;

  NumberAnswer({this.text, required super.id});

  @override
  Answer copyWith({
    String? text,
  }) {
    return NumberAnswer(text: text ?? this.text, id: id);
  }

  @override
  String get key => QuestionType.number.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "text": text, "key": key};
  }
}
