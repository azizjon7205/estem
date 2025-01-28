import '/shared/models/question.dart';
import '../answer.dart';

class SmileAnswer extends Answer {
  int? value;

  SmileAnswer({this.value, required super.id});

  @override
  Answer copyWith({
    int? value,
  }) {
    return SmileAnswer(value: value ?? this.value, id: id);
  }

  @override
  String get key => QuestionType.smile.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "value": value, "key": key};
  }
}
