import '../domain/entities/main_user.dart';

class MainState {
  MainUser? user;

  MainState({
    this.user,
  });

  MainState copyWith({
    MainUser? user,
}) {
    return MainState(user: user ?? this.user);
  }
}
