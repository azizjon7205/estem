class FilterParams {
  List<int>? categories;
  List<int>? regions;
  double? priceFrom;
  double? priceTo;
  bool? isRecent;
  bool? isForYou;

  FilterParams({
    this.categories,
    this.regions,
    this.priceFrom,
    this.priceTo,
    this.isRecent,
    this.isForYou,
  });

  FilterParams copyWith({
    List<int>? categories,
    List<int>? regions,
    double? priceFrom,
    double? priceTo,
    bool? isRecent,
    bool? isForYou,
  }) {
    return FilterParams(
      categories: categories ?? this.categories,
      regions: regions ?? this.regions,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      isRecent: isRecent ?? this.isRecent,
      isForYou: isForYou ?? this.isForYou,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categories": categories,
      "cities": regions,
      "from": priceFrom,
      "to": priceTo,
      "is_recent": isRecent,
      "is_for_you": isForYou,
    };
  }
}
