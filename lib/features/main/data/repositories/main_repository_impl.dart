
import '../../domain/entities/main_user.dart';
import '../../domain/repositories/main_repository.dart';
import '../remote/main_api.dart';

class MainRepositoryImpl extends MainRepository {
  final MainApi _api;

  MainRepositoryImpl(this._api);

  @override
  Future<MainUser> getMainUser() {
    return _api.getMainUser();
  }

}