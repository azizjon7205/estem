
import '../question.dart';

class TimePickerQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;
  int? hour;
  int? minutes;

  TimePickerQuestion({
    this.id,
    required this.question,
    this.image,
    required this.isRequired,
    required this.hour,
    required this.minutes
  });

  @override
  String get questionType => throw UnimplementedError();
}
