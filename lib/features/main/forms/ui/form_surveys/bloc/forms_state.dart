import '/shared/models/survey.dart';

class FormsState {
  final bool isLoading;
  final String? errorMessage;
  final List<Survey> surveys;
  final String tabState;

  FormsState({
    required this.isLoading,
    required this.errorMessage,
    required this.surveys,
    required this.tabState,
  });

  FormsState copyWith(
      {bool? isLoading, String? errorMessage, List<Survey>? surveys, String? tabState,}) {
    return FormsState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        surveys: surveys ?? this.surveys,
      tabState: tabState ?? this.tabState
    );
  }
}

enum Forms { published, draft, completed }

extension FormTabs on Forms {
  String get label {
    switch (this) {
      case Forms.published:
        return 'forms.published';
      case Forms.draft:
        return 'forms.draft';
      case Forms.completed:
        return 'forms.completed';
    }
  }
}
