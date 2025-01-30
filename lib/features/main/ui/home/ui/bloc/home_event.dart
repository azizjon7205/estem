import '../../../../domain/entities/main_user.dart';

abstract class HomeEvent {}

class LoadHomeSurveys extends HomeEvent {}

class LoadHomeCatalogs extends HomeEvent {}

class OnLoadMainUser extends HomeEvent {
  MainUser? user;

  OnLoadMainUser(this.user);
}

class OnToggleBalanceVisibility extends HomeEvent {}
