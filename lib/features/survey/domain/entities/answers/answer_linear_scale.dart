import '/shared/models/question.dart';
import '../answer.dart';

class LinearScaleAnswer extends Answer {
  int? scale;

  LinearScaleAnswer({this.scale, required super.id});

  @override
  Answer copyWith({
    int? scale,
  }) {
    return LinearScaleAnswer(scale: scale ?? this.scale, id: id);
  }

  @override
  String get key => QuestionType.linearScale.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "scale": scale, "key": key};
  }
}
