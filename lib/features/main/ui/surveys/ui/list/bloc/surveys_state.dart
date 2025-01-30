import '../../../../../../../shared/models/survey.dart';

class SurveysState {
  bool isLoading;
  List<Survey> surveys;

  SurveysState({
    this.isLoading = false,
    this.surveys = const [],
  });

  SurveysState copyWith({bool? isLoading, List<Survey>? surveys}) {
    return SurveysState(
      isLoading: isLoading ?? this.isLoading,
      surveys: surveys ?? this.surveys,
    );
  }
}
