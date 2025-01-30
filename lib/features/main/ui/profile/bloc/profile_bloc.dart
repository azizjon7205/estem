

import 'package:bloc/bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<LoadProfile>((event, emit){
      //dummy data
      final profile = {
        'name': 'John Macintosh',
        'gender': 'Male',
        'age': 23,
        'city': 'Tashkent',
        'income': '1,000,000 - 5,000,000',
        'education': 'Master degree',
        'employmentStatus': 'Full-Time Employment',
        'interests': ['Games Online', 'Concert', 'Music', 'Movie', 'Art'],
      };
      emit(ProfileLoaded(
        name: profile['name'] as String,
        gender: profile['gender'] as String,
        age: profile['age'] as int,
        city: profile['city'] as String,
        income: profile['income'] as String,
        education: profile['education'] as String,
        employmentStatus: profile['employmentStatus'] as String,
        interests: List<String>.from(profile['interests'] as List,),
      ));
    });
    on<UpdateProfile>((event, emit) {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        emit(ProfileLoaded(
          name: event.name,
          gender: event.gender,
          age: event.age,
          city: event.city,
          income: event.income,
          education: event.education,
          employmentStatus: event.employmentStatus,
          interests: currentState.interests,
        ));
      }
    });
    on<UpdateInterests>((event, emit) {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        emit(ProfileLoaded(
          name: currentState.name,
          gender: currentState.gender,
          age: currentState.age,
          city: currentState.city,
          income: currentState.income,
          education: currentState.education,
          employmentStatus: currentState.employmentStatus,
          interests: event.interests,
        ));
      }
    });
  }
}
