import '/shared/models/category.dart';
import '/shared/models/region.dart';

class FilterAttributes {
  List<Category> categories;
  List<Region> regions;

  FilterAttributes({
    required this.categories,
    required this.regions,
  });

  factory FilterAttributes.fromJson(Map<String, dynamic> json) {
    return FilterAttributes(
      categories: List<Category>.from(json['categories'].map(
        (e) => Category.fromJson(e),
      )),
      regions: List<Region>.from(json['cities'].map(
        (e) => Region.fromJson(e),
      )),
    );
  }
}
