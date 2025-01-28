import '../question.dart';

class SmileQuestion extends Question {
  Map<int, String> ratingLabels = {1: "", 2: "", 3: "", 4: "", 5: ""};

  SmileQuestion({
    super.id,
    required super.question,
    super.image,
    required super.isRequired,
    required this.ratingLabels,
  });

  @override
  Question copyWith({
    dynamic id,
    String? question,
    String? image,
    bool? isRequired,
    Map<int, String>? ratingLabels,
  }) {
    return SmileQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
      ratingLabels: ratingLabels ?? this.ratingLabels,
    );
  }

  @override
  QuestionType get questionType => QuestionType.smile;

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": question,
      "photo": image,
      "required": isRequired,
      "options": ratingLabels.entries
        .map((entry) => {"option": entry.value, "key": entry.key})
        .toList(),
      "type": questionType.type
    };
  }

  factory SmileQuestion.fromJson(Map<String, dynamic> json) {
    return SmileQuestion(
      id: json['id'],
      image: json['photo'],
      question: json['title'],
      isRequired: json['required'],
      ratingLabels: {
        for (var item
            in List<Map<String, dynamic>>.from(json['options'].map((e) => e)))
          int.tryParse(item['key']) ?? 0: item['option']
      },
    );
  }
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

Map<int, String> getSmileStrings() {
  return {
    1: "worst",
    2: "dislike",
    3: "neutral",
    4: "like",
    5: "best",
  };
}
