import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../domain/repositories/main_repository.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _repository;

  final GlobalKey firstItemKey = GlobalKey();

  MainBloc({required MainRepository repository})
      : _repository = repository,
        super(MainState()) {
    on<OnLoadUserData>(_loadMainUser);
  }

  void _loadMainUser(OnLoadUserData event, Emitter<MainState> emit) async {
    emit(state.copyWith());
    try {
      final response = await _repository.getMainUser();
      print("User load $response");
      emit(state.copyWith(user: response));
    } catch (e) {
      print("User load error : $e");
      emit(
        state.copyWith(),
      );
    }
  }
}
