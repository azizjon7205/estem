class Survey {
  dynamic id;
  String image;
  String title;
  int duration;
  int price;
  DateTime date;

  Survey({
    this.id,
    required this.image,
    required this.title,
    required this.duration,
    required this.price,
    required this.date,
  });


}

Survey dummySurvey() {
  return Survey(image: 'https://picsum.photos/id/1/200/300', title: 'Women\'s leadership conference', duration: 5, price: 5000, date: DateTime.now());
}
