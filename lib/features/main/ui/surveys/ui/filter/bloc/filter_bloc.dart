import 'package:bloc/bloc.dart';

import '/core/utils/messages/show_error_message.dart';
import '../../../domain/repositories/filter_repository.dart';
import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final FilterRepository _repository;

  FilterBloc(this._repository) : super(FilterState()) {
    on<OnLoadFilterAttr>(_onLoadFilterAttributes);
    on<OnCategorySelected>(_onCategorySelect);
    on<OnRegionSelected>(_onRegionSelect);
    on<OnLeftRangeChanged>(_onLeftRangeChanged);
    on<OnRightRangeChanged>(_onRightRangeChanged);
    on<OnReset>(_onReset);
  }

  void _onLoadFilterAttributes(
      OnLoadFilterAttr event, Emitter<FilterState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      regionId: state.regionId,
      categoryId: state.categoryId,
      priceFrom: state.priceFrom,
      priceTo: state.priceTo,
    ));
    try {
      final response = await _repository.getFilterAttributes();
      emit(state.copyWith(
        isLoading: false,
        categories: response.categories,
        regions: response.regions,
        regionId: state.regionId,
        categoryId: state.categoryId,
        priceFrom: state.priceFrom,
        priceTo: state.priceTo,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        regionId: state.regionId,
        categoryId: state.categoryId,
        priceFrom: state.priceFrom,
        priceTo: state.priceTo,
      ));
      showErrorMessage(e.toString());
    }
  }

  void _onCategorySelect(OnCategorySelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      categoryId: event.id,
      regionId: state.regionId,
      priceFrom: state.priceFrom,
      priceTo: state.priceTo,
    ));
  }

  void _onRegionSelect(OnRegionSelected event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      regionId: event.id,
      categoryId: state.categoryId,
      priceFrom: state.priceFrom,
      priceTo: state.priceTo,
    ));
  }

  void _onLeftRangeChanged(
      OnLeftRangeChanged event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      priceFrom: event.value,
      regionId: state.regionId,
      categoryId: state.categoryId,
      priceTo: state.priceTo,
    ));
  }

  void _onRightRangeChanged(
      OnRightRangeChanged event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      priceTo: event.value,
      regionId: state.regionId,
      categoryId: state.categoryId,
      priceFrom: state.priceFrom,
    ));
  }

  void _onReset(OnReset event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      regionId: null,
      categoryId: null,
      priceFrom: 0.0,
      priceTo: 0.0
    ));
  }
}
