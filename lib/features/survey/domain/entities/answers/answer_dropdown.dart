import '/shared/models/question.dart';
import '../answer.dart';

class DropdownAnswer extends Answer {
  dynamic option;

  DropdownAnswer({this.option, required super.id});

  @override
  Answer copyWith({
    dynamic option,
    String? other,
  }) {
    return DropdownAnswer(option: option ?? this.option, id: id);
  }

  @override
  String get key => QuestionType.dropdown.type;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "option": option,
      "key": key,
    };
  }
}
