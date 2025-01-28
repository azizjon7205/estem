import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_surveys.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository)
      : super(
          HomeState(
            isUserDataLoading: false,
            isSurveysDataLoading: false,
            isCatalogsLoading: false,
            surveys: HomeSurveys(recentSurveys: [], recommendedSurveys: []),
            catalogs: [],
            errorMessage: null,
          ),
        ) {
    on<LoadHomeSurveys>(_loadHomeSurveys);
    on<LoadHomeCatalogs>(_loadHomeCatalogs);
    on<LoadHomeUser>(_loadHomeUser);
    // events here
  }

  void _loadHomeSurveys(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isSurveysDataLoading: true, errorMessage: null));
    try {
      final response = await _repository.getHomeSurveys();
      emit(state.copyWith(isSurveysDataLoading: false, surveys: response));
    } catch (e) {
      emit(state.copyWith(
          isSurveysDataLoading: false, errorMessage: e.toString()));
    }
  }

  void _loadHomeCatalogs(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isCatalogsLoading: true, errorMessage: null));
    try {
      final response = await _repository.getHomeCatalogs();
      emit(state.copyWith(
          isCatalogsLoading: false, catalogs: response.sublist(0, 3)));
    } catch (e) {
      emit(
          state.copyWith(isCatalogsLoading: false, errorMessage: e.toString()));
    }
  }

  void _loadHomeUser(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isUserDataLoading: true, errorMessage: null));
    try {
      final response = await _repository.getHomeUser();
      print("User load $response");
      emit(state.copyWith(isUserDataLoading: false, user: response));
    } catch (e) {
      print("User load error : $e");
      emit(
        state.copyWith(isUserDataLoading: false, errorMessage: e.toString()),
      );
    }
  }
}
