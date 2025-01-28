
import '../entities/home_catalog.dart';

abstract class HomeCatalogsRepository {
  Future<List<HomeCatalog>> getHomeSurveys();
}
