import 'package:estem/shared/models/question.dart';

class StarRatingQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;
  // int rating;
  // String label;
  Map<double, String> ratingLabels;

  StarRatingQuestion(
      {this.id,
      required this.question,
      this.image,
      required this.isRequired,
      // required this.rating,
      // required this.label,
        required this.ratingLabels,
      });

  @override
  String get questionType => throw UnimplementedError();
}
