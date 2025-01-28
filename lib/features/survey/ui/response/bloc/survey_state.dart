
import '../../../domain/entities/answer.dart';
import '/shared/models/question.dart';

class SurveyState {
  dynamic id;
  List<Question> questions;
  List<Answer> answers;
  String? errorMessage;
  String? successMessage;
  bool isLoading;
  bool isPreview;

  SurveyState({
    this.id,
    required this.questions,
    required this.errorMessage,
    required this.successMessage,
    required this.isLoading,
    this.answers = const [],
    this.isPreview = false,
  });

  SurveyState copyWith(
      {dynamic id,
      List<Question>? questions,
      List<Answer>? answers,
      String? errorMessage,
      String? successMessage,
      bool? isLoading,
      bool? isPreview,
      }) {
    return SurveyState(
      id: id ?? this.id,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      isLoading: isLoading ?? this.isLoading,
      isPreview: isPreview ?? this.isPreview
    );
  }
}
