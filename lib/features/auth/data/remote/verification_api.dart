import '/shared/models/auth_success.dart';

abstract class VerificationApi {
  Future<AuthSuccess> confirmSmsCode(String phone, String code);
}