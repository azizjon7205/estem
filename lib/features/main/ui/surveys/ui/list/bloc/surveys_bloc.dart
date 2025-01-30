import 'package:bloc/bloc.dart';

import '/core/utils/messages/show_error_message.dart';
import '../../../domain/repositories/filter_repository.dart';
import 'surveys_events.dart';
import 'surveys_state.dart';

class SurveysBloc extends Bloc<SurveysEvent, SurveysState> {
  final FilterRepository _repository;

  SurveysBloc(this._repository) : super(SurveysState()) {
    on<OnLoadSurveys>(_onLoadSurveys);
  }

  void _onLoadSurveys(OnLoadSurveys event, Emitter<SurveysState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _repository.getSurveys(event.params);
      emit(state.copyWith(isLoading: false, surveys: response));
    } catch (e) {
      showErrorMessage(e.toString());
    }
  }
}
