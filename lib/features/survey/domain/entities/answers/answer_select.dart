import '/shared/models/question.dart';
import '../answer.dart';

class SelectAnswer extends Answer {
  dynamic option;
  String? other;

  SelectAnswer({this.option, this.other, required super.id});

  @override
  Answer copyWith({
    dynamic option,
    String? other,
  }) {
    return SelectAnswer(
        option: option ?? this.option, other: other ?? this.other, id: id);
  }

  @override
  String get key => QuestionType.select.type;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "option": option,
      "other": other,
      "key": key,
    };
  }
}
