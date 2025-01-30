class MainUser {
  dynamic id;
  String name;
  String image;
  double balance;

  MainUser({
    required this.id,
    required this.name,
    required this.image,
    required this.balance,
  });

  factory MainUser.fromJson(Map<String, dynamic> json) {
    return MainUser(
        id: json['id'],
        name: json['name'],
        image: json['photo'],
        balance: json['balance'],
    );
  }

  @override
  String toString() {
    return 'MainUser(id: $id, name: $name, image: $image, balance: $balance)';
  }
}
