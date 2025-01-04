import '../../domain/repositories/auth_repository.dart';
import '../remote/auth_api.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi _api;

  AuthRepositoryImpl(this._api);

  @override
  Future<String> login(String phone) async {
    return await _api.loginUser(phone);
  }
}
