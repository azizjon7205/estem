
import '../question.dart';

class UploadFileQuestion extends Question {
  dynamic id;
  String question;
  String? image;
  bool isRequired;

  UploadFileQuestion({
    this.id,
    required this.question,
    this.image,
    required this.isRequired,
  });

  @override
  String get questionType => throw UnimplementedError();
}
