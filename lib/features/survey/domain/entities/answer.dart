abstract class Answer {

  dynamic id;

  Answer({required this.id});

  Answer copyWith();

  String get key;

  Map<String, dynamic> toJson();
}