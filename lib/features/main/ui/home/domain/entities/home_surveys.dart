import '/shared/models/survey.dart';

class HomeSurveys {
  List<Survey> recentSurveys;
  List<Survey> recommendedSurveys;

  HomeSurveys({
    required this.recentSurveys,
    required this.recommendedSurveys,
  });

  factory HomeSurveys.fromJson(Map<String, dynamic> json) {
    return HomeSurveys(
      recentSurveys: List<Survey>.from(
        json['recents'].map<Survey>((e) => Survey.fromJson(e)),
      ),
      recommendedSurveys: List<Survey>.from(
        json['for_you'].map<Survey>((e) => Survey.fromJson(e)),
      ),
    );
  }

  @override
  String toString() {
    return 'HomeSurveys(recentSurveys: $recentSurveys, recommendedSurveys: $recommendedSurveys)';
  }
}
