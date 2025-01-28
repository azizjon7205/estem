import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/log/app_logger.dart';
import '../../../domain/repositories/survey_pass_repository.dart';
import 'start_survey_event.dart';
import 'start_survey_state.dart';

class StartSurveyBloc extends Bloc<StartSurveyEvent, StartSurveyState> {
  final SurveyPassRepository _repository;

  StartSurveyBloc({required SurveyPassRepository repository})
      : _repository = repository,
        super(StartSurveyState()) {
    on<OnLoadSurvey>(_onLoadSurvey);
    on<OnFetchSurvey>(_onFetchSurvey);
  }

  void _onLoadSurvey(OnLoadSurvey event, Emitter<StartSurveyState> emit) {
    emit(state.copyWith(survey: event.survey, isFromPreview: event.isPreview));
  }

  void _onFetchSurvey(OnFetchSurvey event, Emitter<StartSurveyState> emit) async{
    emit(state.copyWith(isFromPreview: event.isPreview, survey: null));

    try {
      final response = await _repository.getSurvey(event.id);
      emit(state.copyWith(survey: response));
      logger.info("OnFetch survey response: $response");
    } catch (e) {
      logger.info("OnFetch survey error: $e");
    }
  }
}
