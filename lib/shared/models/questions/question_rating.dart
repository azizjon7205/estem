import '../question.dart';

class StarRatingQuestion extends Question {
  Map<int, String> ratingLabels = {1: "", 2: "", 3: "", 4: "", 5: ""};

  StarRatingQuestion({
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
    return StarRatingQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      isRequired: isRequired ?? this.isRequired,
      ratingLabels: ratingLabels ?? this.ratingLabels,
    );
  }

  @override
  QuestionType get questionType => QuestionType.starRating;

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

  factory StarRatingQuestion.fromJson(Map<String, dynamic> json) {
    return StarRatingQuestion(
      id: json['id'],
      image: json['photo'],
      question: json['title'],
      isRequired: json['required'],
      ratingLabels: { for (var item in List<Map<String, dynamic>>.from(json['options'].map((e) => e))) int.tryParse(item['key']) ?? 0 : item['option'] },
    );
  }
}

Map<int, String> getRatingStrings() {
  return {
    1: "worst",
    2: "not_good",
    3: "neutral",
    4: "good",
    5: "very_good",
  };
}
