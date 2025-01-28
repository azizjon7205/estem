import '/shared/models/question.dart';
import '../answer.dart';

class UploadFileAnswer extends Answer {
  String? fileUrl;
  dynamic tempId;
  bool isLoading;
  double size;
  String? name;

  UploadFileAnswer({
    this.fileUrl,
    this.tempId,
    this.size = 0.0,
    this.isLoading = false,
    this.name,
    required super.id,
  });

  @override
  Answer copyWith({
    String? fileUrl,
    dynamic tempId,
    bool? isLoading,
    double? size,
    String? name,
  }) {
    return UploadFileAnswer(
      fileUrl: fileUrl ?? this.fileUrl,
      tempId: tempId ?? this.tempId,
      isLoading: isLoading ?? this.isLoading,
      size: size ?? this.size,
      name: name ?? this.name,
      id: id,
    );
  }

  @override
  String get key => QuestionType.fileUpload.type;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "file": fileUrl,
      "key": key,
    };
  }
}
