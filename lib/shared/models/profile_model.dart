class ProfileModel {
  String name;
  String gender;
  int age;
  String city;
  String income;
  String education;
  String employmentStatus;
  List<String> interests;

  ProfileModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.city,
    required this.income,
    required this.education,
    required this.employmentStatus,
    required this.interests,
  });

  ProfileModel copyWith({
    String? name,
    String? gender,
    int? age,
    String? city,
    String? income,
    String? education,
    String? employmentStatus,
    List<String>? interests,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      city: city ?? this.city,
      income: income ?? this.income,
      education: education ?? this.education,
      employmentStatus: employmentStatus ?? this.employmentStatus,
      interests: interests ?? this.interests,
    );
  }
}
