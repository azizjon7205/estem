abstract class StatisticsState {}

class StatisticsLoading extends StatisticsState {}

class StatisticsLoaded extends StatisticsState {
  final int totalSurveys;
  final Map<String, double> categoryStats;
  final List<int> weeklyData;

  StatisticsLoaded({
    required this.totalSurveys,
    required this.categoryStats,
    required this.weeklyData,
  });
}
