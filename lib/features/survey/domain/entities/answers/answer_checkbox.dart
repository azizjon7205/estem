import '/shared/models/question.dart';
import '../answer.dart';

class CheckboxAnswer extends Answer {
  Set<dynamic>? options;
  String? other;

  CheckboxAnswer({this.options, this.other, required super.id});

  @override
  Answer copyWith({
    Set<dynamic>? options,
    String? other,
  }) {
    return CheckboxAnswer(
        options: options ?? this.options, other: other ?? this.other, id: id);
  }

  @override
  String get key => QuestionType.checkbox.type;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "options": options?.toList(),
      "other": other,
      "key": key,
    };
  }
}
