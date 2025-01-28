import '/shared/models/question.dart';
import '../answer.dart';

class EmailAnswer extends Answer {
  String? text;

  EmailAnswer({this.text, required super.id});

  @override
  Answer copyWith({
    String? text,
  }) {
    return EmailAnswer(text: text ?? this.text, id: id);
  }

  @override
  String get key => QuestionType.email.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "text": text, "key": key};
  }
}
