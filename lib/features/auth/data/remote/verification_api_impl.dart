import '/shared/models/auth_success.dart';

import '/core/network/api_service.dart';
import 'verification_api.dart';

class VerificationApiImpl extends VerificationApi {
  final ApiService _network;

  VerificationApiImpl(this._network);

  @override
  Future<AuthSuccess> confirmSmsCode(String phone, String code) async {
    return _network.post<AuthSuccess>(
      'api/v1/auth/confirm',
      data: {"phone_number": phone, "code": code},
      tFromJson: AuthSuccess.fromJson,
    );
  }
}
