import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/forms_repository.dart';
import 'form_actions_event.dart';
import 'form_actions_state.dart';

class FormActionsBloc extends Bloc<FormActionsEvent, FormActionsState> {
  final FormsRepository _repository;

  FormActionsBloc(this._repository, bool status)
      : super(
            FormActionsState(status: status, successMessage: null, id: null, isLoading: false)) {
    on<OnStatusChanged>(_onStatusChanged);
    on<OnSurveyEdit>(_onSurveyEdit);
    on<OnSurveyDuplicate>(_onSurveyDuplicate);
    on<OnSurveyDelete>(_onSurveyDelete);
  }

  void _onStatusChanged(
      OnStatusChanged event, Emitter<FormActionsState> emit) async {
    emit(state.copyWith(
      status: event.status
    ));
  }

  void _onSurveyEdit(
      OnSurveyEdit event, Emitter<FormActionsState> emit) async {}

  void _onSurveyDuplicate(
      OnSurveyDuplicate event, Emitter<FormActionsState> emit) async {}

  void _onSurveyDelete(
      OnSurveyDelete event, Emitter<FormActionsState> emit) async {}
}
