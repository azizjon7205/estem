
import 'package:estem/features/main/home/domain/entities/home_user.dart';

import '../../domain/entities/home_surveys.dart';
import '../../domain/entities/home_catalog.dart';

class HomeState {
  bool isUserDataLoading;
  bool isSurveysDataLoading;
  bool isCatalogsLoading;
  HomeSurveys surveys;
  List<HomeCatalog> catalogs;
  HomeUser? user;
  String? errorMessage;

  HomeState({
    required this.isUserDataLoading,
    required this.isSurveysDataLoading,
    required this.isCatalogsLoading,
    required this.surveys,
    required this.catalogs,
    required this.errorMessage,
    this.user
  });

  HomeState copyWith({
    bool? isUserDataLoading,
    bool? isSurveysDataLoading,
    bool? isCatalogsLoading,
    HomeSurveys? surveys,
    List<HomeCatalog>? catalogs,
    String? errorMessage,
    HomeUser? user,
  }) {
    return HomeState(
      isUserDataLoading: isUserDataLoading ?? this.isUserDataLoading,
      isSurveysDataLoading: isSurveysDataLoading ?? this.isSurveysDataLoading,
      isCatalogsLoading: isCatalogsLoading ?? this.isCatalogsLoading,
      surveys: surveys ?? this.surveys,
      catalogs: catalogs ?? this.catalogs,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user
    );
  }
}
