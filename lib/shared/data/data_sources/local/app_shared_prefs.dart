import 'package:shared_preferences/shared_preferences.dart';

import '/core/utils/constants/local_storage_constants.dart';
import '../../../models/app_lang.dart';


class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  /// __________ Language __________ ///
  AppLang getLang() {
    String? data = _preferences.getString(LocalStorageKey.lang.rawValue);
    if (data == null) {
      return AppLang.russian;
    }
    return AppLang.values.firstWhere((element) => element.code == data);
  }

  void setLang(AppLang language) {
    _preferences.setString(LocalStorageKey.lang.rawValue, language.code);
    // _langChange.add(language);
  }

  /// __________ Dark Theme __________ ///
  bool getIsDarkTheme() {
    return _preferences.getBool(LocalStorageKey.theme.rawValue) ?? false;
  }

  void setDarkTheme(bool isDark) {
    _preferences.setBool(LocalStorageKey.theme.rawValue, isDark);
  }

  void setAuthToken(String token) {
    _preferences.setString(LocalStorageKey.accessToken.rawValue, token);
  }

  Future<void> removeAuthToken() {
    return _preferences.remove(LocalStorageKey.accessToken.rawValue);
  }

  String? getAuthToken() {
    return _preferences.getString(LocalStorageKey.accessToken.rawValue);
  }

  void setRefreshToken(String token) {
    _preferences.setString(LocalStorageKey.refreshToken.rawValue, token);
  }

  Future<void> removeRefreshToken() {
    return _preferences.remove(LocalStorageKey.refreshToken.rawValue);
  }

  String? getRefreshToken() {
    return _preferences.getString(LocalStorageKey.refreshToken.rawValue);
  }

  /// Push token
  void setPushToken(String token) {
    _preferences.setString(LocalStorageKey.fcmToken.rawValue, token);
  }

  Future<void> removePushToken() {
    return _preferences.remove(LocalStorageKey.fcmToken.rawValue);
  }

  String? getPushToken() {
    return _preferences.getString(LocalStorageKey.fcmToken.rawValue);
  }

  /// UUID
  void setUuid(String token) {
    _preferences.setString(LocalStorageKey.uuid.rawValue, token);
  }

  Future<void> removeUuid() {
    return _preferences.remove(LocalStorageKey.uuid.rawValue);
  }

  String? getUuid() {
    return _preferences.getString(LocalStorageKey.uuid.rawValue);
  }

  /// PhoneNumber  998991112233
  void setPhoneNumber(String phone) {
    _preferences.setString(LocalStorageKey.phoneNumber.rawValue, phone);
  }

  Future<void> removePhoneNumber() {
    return _preferences.remove(LocalStorageKey.phoneNumber.rawValue);
  }

  String? getPhoneNumber() {
    return _preferences.getString(LocalStorageKey.phoneNumber.rawValue);
  }

  /// Onboarding
  void setOnboarding(bool value) {
    _preferences.setBool(LocalStorageKey.onboardingComplete.rawValue, value);
  }

  bool getOnboardingComplete() {
    return _preferences.getBool(LocalStorageKey.onboardingComplete.rawValue) ?? false;
  }
}
