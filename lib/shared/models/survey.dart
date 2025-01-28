class Survey {
  dynamic id;
  String image;
  String title;
  String description;
  int duration;
  double price;
  DateTime date;

  Survey({
    this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.duration,
    required this.price,
    required this.date,
  });

  factory Survey.formJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      image: json['photo'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? 0,
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      date:
          json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "duration": duration,
      "price": price
    };
  }

  @override
  String toString() {
    return 'Survey(image: $image, title: $title, duration: $duration, price: $price, date: $date)';
  }
}

Survey dummySurvey() {
  return Survey(
      image: 'https://picsum.photos/id/1/200/300',
      title: 'Women\'s leadership conference',
      description:
          'Description of survey lorem ipsum dolor sit amet, consecteturlorem ipsum dolor  lorem ipsum, consectetur... ',
      duration: 5,
      price: 5000,
      date: DateTime.now());
}
