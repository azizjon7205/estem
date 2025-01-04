import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<String> call(String phoneNumber) async {
    final phone = phoneNumber.replaceAll(' ', '');
    if (phone.isEmpty || phone.length != 9) {
      throw Exception("Phone number must be 9 digits long");
    }

    return await _repository.login('998$phone');
  }
}