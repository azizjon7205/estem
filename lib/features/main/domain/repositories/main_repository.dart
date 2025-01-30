import '../entities/main_user.dart';

abstract class MainRepository {
  Future<MainUser> getMainUser();
}