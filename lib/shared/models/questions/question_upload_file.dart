import '../question.dart';

class UploadFileQuestion extends Question {
  UploadFileQuestion({
    super.id,
    required super.question,
    super.image,
    required super.isRequired,
  });

  @override
  Question copyWith({
    dynamic id,
    String? question,
    String? image,
    bool? isRequired,
  }) {
    return UploadFileQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
    );
  }

  @override
  QuestionType get questionType => QuestionType.fileUpload;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": question,
      "photo": image,
      "required": isRequired,
      "type": questionType.type
    };
  }

  factory UploadFileQuestion.fromJson(Map<String, dynamic> json) {
    return UploadFileQuestion(
      id: json['id'],
      image: json['photo'],
      question: json['title'],
      isRequired: json['required'],
    );
  }
}
