import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/forms_repository.dart';
import 'forms_event.dart';
import 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {

  final FormsRepository _repository;

  FormsBloc(this._repository)
      : super(FormsState(
    isLoading: true,
    errorMessage: null,
    surveys: [],
    tabState: Forms.published.name,
  ),) {
    on<LoadUserSurveys>(_onLoadUserSurveys);
  }


  void _onLoadUserSurveys(LoadUserSurveys event, Emitter<FormsState> emit) async {
    emit(state.copyWith(tabState: event.tab, isLoading: true, errorMessage: null));

    try {
      final response = await _repository.getUserSurveys(event.tab);
      emit(state.copyWith(
        isLoading: false,
        surveys: response
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString()
      ));
    }

  }


}
