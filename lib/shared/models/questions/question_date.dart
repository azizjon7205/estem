

import '../question.dart';

class DatePickerQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;
  DateTime dateTime;

  DatePickerQuestion({
    this.id,
    required this.question,
    this.image,
    required this.isRequired,
    required this.dateTime
  });

  @override
  String get questionType => throw UnimplementedError();
}
