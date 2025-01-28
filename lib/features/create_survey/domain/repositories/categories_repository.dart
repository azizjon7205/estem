import '/shared/models/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getCategories();
}