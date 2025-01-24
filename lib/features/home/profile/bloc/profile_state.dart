
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState{}

class ProfileLoaded extends ProfileState{
  final String name;
  final String gender;
  final int age;
  final String city;
  final String income;
  final String education;
  final String employmentStatus;
  final List<String> interests;


  ProfileLoaded({
    required this.name,
    required this.gender,
    required this.age,
    required this.city,
    required this.income,
    required this.education,
    required this.employmentStatus,
    required this.interests,
});
  @override
  // TODO: implement props
  List<Object?> get props => [name, gender, age, city, income,  education, employmentStatus, interests];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}




