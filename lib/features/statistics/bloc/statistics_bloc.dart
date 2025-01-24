import 'package:estem/features/statistics/bloc/statistics_event.dart';
import 'package:estem/features/statistics/bloc/statistics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsLoading()) {
    on<LoadStatistics>((event, emit) {
      // dummy data loading
      const totalSurveys = 789;
      final  categoryStats = {
        'Sport': 11.0,
        'Science': 25.0,
        'Music': 9.0,
        'Art': 21.0,
        'Math': 29.0,
        'Other': 5.0,
      };
      final weeklyData = [10, 20, 50, 30, 40, 50, 60];

      emit(StatisticsLoaded(
        totalSurveys: totalSurveys,
        categoryStats: categoryStats,
        weeklyData: weeklyData,
      ));
    });
  }
}
