import '../../domain/entities/home_catalog.dart';
import '../../domain/entities/home_surveys.dart';

abstract class HomeApi {
  Future<HomeSurveys> getHomeSurveys();

  Future<List<HomeCatalog>> getHomeCatalogs();
}