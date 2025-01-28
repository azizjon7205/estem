import '/shared/models/category.dart';

abstract class CategoriesApi {
  Future<List<Category>> getCategories();
}