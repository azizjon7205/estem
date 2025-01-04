abstract class VerificationRepository {
  Future<bool> confirmSms(String phone, String code);
}