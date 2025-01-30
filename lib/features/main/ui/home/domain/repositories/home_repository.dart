import '../entities/home_catalog.dart';
import '../entities/home_surveys.dart';

abstract class HomeRepository {
  Future<List<HomeCatalog>> getHomeCatalogs();

  Future<HomeSurveys> getHomeSurveys();

}