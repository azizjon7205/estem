import '/shared/models/question.dart';
import '../answer.dart';

class DateAnswer extends Answer {
  String? date;

  DateAnswer({this.date, required super.id});

  @override
  Answer copyWith({
    String? date,
  }) {
    return DateAnswer(date: date ?? this.date, id: id);
  }

  @override
  String get key => QuestionType.date.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "date": date, "key": key};
  }
}
