class FormActionsState {
  bool status;
  String? successMessage;
  dynamic id;
  bool isLoading;

  FormActionsState({
    required this.status,
    required this.successMessage,
    required this.id,
    required this.isLoading
  });

  FormActionsState copyWith({
    bool? status,
    String? success,
    dynamic id,
    bool? loading,
  }) {
    return FormActionsState(
        status: status ?? this.status,
        successMessage: success ?? successMessage,
        id: id ?? this.id,
      isLoading: loading ?? isLoading
    );
  }
}
