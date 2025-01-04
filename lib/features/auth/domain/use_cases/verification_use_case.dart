import '../repositories/verification_repository.dart';

class VerificationUseCase {
  final VerificationRepository _repository;

  VerificationUseCase(this._repository);

  Future call(String phone, String code) async {
    final phoneNumber = phone.replaceAll(' ', '');
    return await _repository.confirmSms('998$phoneNumber', code);
  }
}
