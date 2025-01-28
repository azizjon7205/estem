class HomeCatalog {
  dynamic id;
  String icon;
  String name;
  String color;

  HomeCatalog({
    required this.id,
    required this.icon,
    required this.name,
    required this.color,
  });

  factory HomeCatalog.fromJson(Map<String, dynamic> json) {
    return HomeCatalog(
        id: json['id'],
        color: json['color'].toString().startsWith('#') ? json['color'].toString().substring(1) : json['color'],
        name: json['name'],
        icon: json['icon']);
  }

  @override
  String toString() {
    return 'HomeCatalog(id: $id, icon: $icon, name: $name, color: $color)';
  }
}
