import '../../domain/entities/main_user.dart';

abstract class MainApi {
  Future<MainUser> getMainUser();
}