import 'package:estem/shared/models/question.dart';

class OptionQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;
  List<Option> options;
  bool hasOther;

  OptionQuestion(
      {this.id,
      required this.question,
      this.image,
      required this.isRequired,
      required this.options,
      this.hasOther = false});

  @override
  String get questionType => throw UnimplementedError();
}

class Option {
  dynamic id;
  String option;

  Option({
    this.id,
    required this.option,
  });
}
