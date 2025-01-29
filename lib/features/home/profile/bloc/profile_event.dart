import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent{}

class UpdateProfile extends ProfileEvent{
  final String name;
  final String gender;
  final int age;
  final String city;
  final String income;
  final String education;
  final String employmentStatus;

    UpdateProfile({
    required this.name,
    required this.gender,
    required this.age,
    required this.city,
    required this.income,
    required this.education,
    required this.employmentStatus,
});

  @override
  List<Object?> get props => [name, gender, age, city, income, education, employmentStatus];
}

// Update interests
class UpdateInterests extends ProfileEvent {
  final List<String> interests;

  UpdateInterests(this.interests);

  @override
  List<Object?> get props => [interests];
}


