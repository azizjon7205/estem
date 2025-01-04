import '/core/network/api_service.dart';
import 'auth_api.dart';

class AuthApiImpl extends AuthApi {
  final ApiService _network;

  AuthApiImpl(this._network);

  @override
  Future<String> loginUser(String phone) async {
    return await _network.post<String>(
      'api/v1/auth/login',
      queryParameters: {"phoneNumber": phone},
      tFromJson: (json) => json.toString(),
    );
  }
}
