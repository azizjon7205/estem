class HomeUser {
  dynamic id;
  String name;
  String image;
  double balance;

  HomeUser({
    required this.id,
    required this.name,
    required this.image,
    required this.balance,
  });

  factory HomeUser.fromJson(Map<String, dynamic> json) {
    return HomeUser(
        id: json['id'],
        name: json['name'],
        image: json['photo'],
        balance: json['balance'],
    );
  }

  @override
  String toString() {
    return 'HomeUser(id: $id, name: $name, image: $image, balance: $balance)';
  }
}
