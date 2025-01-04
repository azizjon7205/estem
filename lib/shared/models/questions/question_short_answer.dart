import 'package:estem/shared/models/question.dart';

class ShortAnswerQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;

  ShortAnswerQuestion({
    this.id,
    required this.question,
    this.image,
    required this.isRequired,
  });

  @override
  String get questionType => throw UnimplementedError();
}
