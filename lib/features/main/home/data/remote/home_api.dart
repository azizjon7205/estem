import '../../domain/entities/home_catalog.dart';
import '../../domain/entities/home_surveys.dart';
import '../../domain/entities/home_user.dart';

abstract class HomeApi {
  Future<HomeSurveys> getHomeSurveys();

  Future<List<HomeCatalog>> getHomeCatalogs();

  Future<HomeUser> getHomeUser();
}