import '/shared/models/question.dart';
import '../answer.dart';

class TimeAnswer extends Answer {
  String? time;

  TimeAnswer({this.time, required super.id});

  @override
  Answer copyWith({
    String? time,
  }) {
    return TimeAnswer(time: time ?? this.time, id: id);
  }

  @override
  String get key => QuestionType.time.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "time": time, "key": key};
  }
}
