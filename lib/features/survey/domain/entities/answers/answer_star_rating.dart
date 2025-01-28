import '/shared/models/question.dart';
import '../answer.dart';

class StarRatingAnswer extends Answer {
  int? rating;

  StarRatingAnswer({this.rating, required super.id});

  @override
  Answer copyWith({
    int? rating,
  }) {
    return StarRatingAnswer(rating: rating ?? this.rating, id: id);
  }

  @override
  String get key => QuestionType.linearScale.type;

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "rating": rating, "key": key};
  }
}
