import '../entities/home_catalog.dart';
import '../entities/home_surveys.dart';
import '../entities/home_user.dart';

abstract class HomeRepository {
  Future<List<HomeCatalog>> getHomeCatalogs();

  Future<HomeSurveys> getHomeSurveys();

  Future<HomeUser> getHomeUser();
}