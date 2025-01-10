import 'package:estem/shared/models/question.dart';

class StarRatingQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;
  // int rating;
  // String label;
  Map<int, String> ratingLabels;

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

Map<int, String> getSmileIcons() {
  return {
    1: "assets/faces/ic_face_weary_pale.svg",
    2: "assets/faces/ic_face_frowning_pale.svg",
    3: "assets/faces/ic_face_neutral_pale.svg",
    4: "assets/faces/ic_face_smiling_pale.svg",
    5: "assets/faces/ic_face_grinning_pale.svg",
  };
}
