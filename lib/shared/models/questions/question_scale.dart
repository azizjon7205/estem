
import '../question.dart';

class ScaleQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;
  String? leftLabel;
  String? rightLabel;
  int leftScale;
  int rightScale;

  ScaleQuestion({
    this.id,
    required this.question,
    this.image,
    required this.isRequired,
    this.leftLabel,
    this.rightLabel,
    this.leftScale = 1,
    required this.rightScale,
  });

  @override
  String get questionType => throw UnimplementedError();
}
