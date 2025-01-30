

import '../../../domain/entities/filter_params.dart';
import '/shared/models/category.dart';
import '/shared/models/region.dart';

class FilterState {
  dynamic categoryId;
  dynamic regionId;
  List<Category> categories;
  List<Region> regions;
  double? priceFrom;
  double? priceTo;
  bool isLoading;

  FilterState({
    this.categoryId,
    this.regionId,
    this.categories = const [],
    this.regions = const [],
    this.priceFrom,
    this.priceTo,
    this.isLoading = false,
  });

  FilterState copyWith({
    bool? isLoading,
    required dynamic categoryId,
    required dynamic regionId,
    List<Category>? categories,
    List<Region>? regions,
    required double? priceFrom,
    required double? priceTo,
  }) {
    return FilterState(
      isLoading: isLoading ?? this.isLoading,
      categoryId: categoryId ,
      regionId: regionId,
      categories: categories ?? this.categories,
      regions: regions ?? this.regions,
      priceFrom: priceFrom,
      priceTo: priceTo,
    );
  }

  FilterParams mapToFilterParams() {
    return FilterParams(
      regions: regionId != null ? [regionId] : null,
      categories: categoryId != null ? [categoryId] : null,
      priceFrom: priceFrom,
      priceTo: priceTo,
    );
  }

  bool get isChanged {
    return categoryId != null ||
        regionId != null ||
        (priceFrom ?? 0.0) != 0.0 ||
        (priceTo ?? 0.0) != 0.0;
  }
}
