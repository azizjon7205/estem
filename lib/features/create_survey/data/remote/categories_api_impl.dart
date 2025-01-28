import '/core/network/api_service.dart';
import '/shared/models/category.dart';
import 'categories_api.dart';

class CategoriesApiImpl extends CategoriesApi {
  final ApiService _network;

  CategoriesApiImpl(this._network);

  @override
  Future<List<Category>> getCategories() {
    return _network.get(
      'api/app/get_info',
      queryParameters: {"methodId": 9},
      tFromJson: (json) => List<Category>.from(json['categories'].map((e) => Category.fromJson(e))),
    );
  }
}
