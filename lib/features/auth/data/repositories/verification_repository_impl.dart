import '/shared/data/data_sources/local/app_shared_prefs.dart';
import '../../domain/repositories/verification_repository.dart';
import '../remote/verification_api.dart';

class VerificationRepositoryImpl extends VerificationRepository {
  final VerificationApi _api;
  final AppSharedPrefs _sharedPrefs;

  VerificationRepositoryImpl(this._api, this._sharedPrefs);

  @override
  Future<bool> confirmSms(String phone, String code) async {
    try {
      final response = await _api.confirmSmsCode(phone, code);
      print("Verification Rep: >>>> token: ${response.token}");
      _sharedPrefs.setAuthToken(response.token);
      _sharedPrefs.setRefreshToken(response.refreshToken);
      _sharedPrefs.setPhoneNumber(phone);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
