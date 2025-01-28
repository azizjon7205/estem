class Category {
  dynamic id;
  String name;
  String color;
  String icon;

  Category({
    this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      icon: json['icon'],
    );
  }

}
