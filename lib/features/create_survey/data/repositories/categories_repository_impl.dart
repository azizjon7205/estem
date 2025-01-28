
import '../../domain/repositories/categories_repository.dart';
import '../remote/categories_api.dart';
import '/shared/models/category.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesApi _api;

  CategoriesRepositoryImpl(this._api);

  @override
  Future<List<Category>> getCategories() {
    return _api.getCategories();
  }

}