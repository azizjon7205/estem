
import '../../../../domain/entities/main_user.dart';
import '../../domain/entities/home_surveys.dart';
import '../../domain/entities/home_catalog.dart';

class HomeState {
  bool isUserDataLoading;
  bool isSurveysDataLoading;
  bool isCatalogsLoading;
  HomeSurveys surveys;
  List<HomeCatalog> catalogs;
  MainUser? user;
  String? errorMessage;
  bool isBalanceVisible;

  HomeState({
    required this.isUserDataLoading,
    required this.isSurveysDataLoading,
    required this.isCatalogsLoading,
    required this.surveys,
    required this.catalogs,
    required this.errorMessage,
    this.isBalanceVisible = true,
    this.user
  });

  HomeState copyWith({
    bool? isUserDataLoading,
    bool? isSurveysDataLoading,
    bool? isCatalogsLoading,
    HomeSurveys? surveys,
    List<HomeCatalog>? catalogs,
    String? errorMessage,
    MainUser? user,
    bool? isBalanceVisible,
  }) {
    return HomeState(
      isUserDataLoading: isUserDataLoading ?? this.isUserDataLoading,
      isSurveysDataLoading: isSurveysDataLoading ?? this.isSurveysDataLoading,
      isCatalogsLoading: isCatalogsLoading ?? this.isCatalogsLoading,
      surveys: surveys ?? this.surveys,
      catalogs: catalogs ?? this.catalogs,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible
    );
  }
}
