const String theme = "theme";
const String lang = "lang";
const String apiUrl = "api_url";

enum LocalStorageKey {
  theme,
  lang,
  apiUrl,
  accessToken,
  fcmToken,
  uuid,
  phoneNumber,
  onboardingComplete,
  refreshToken;

  String get rawValue {
    switch (this) {
      case LocalStorageKey.theme:
        return 'local_storage_key.theme';
      case LocalStorageKey.lang:
        return 'local_storage_key.lang';
      case LocalStorageKey.apiUrl:
        return 'local_storage_key.api_url';
      case LocalStorageKey.accessToken:
        return 'local_storage_key.access_token';
      case LocalStorageKey.refreshToken:
        return 'local_storage_key.refresh_token';
      case LocalStorageKey.uuid:
        return 'local_storage_key.uuid';
      case LocalStorageKey.fcmToken:
        return 'local_storage_key.fcm_token';
      case LocalStorageKey.phoneNumber:
        return 'local_storage_key.phone_number';
      case LocalStorageKey.onboardingComplete:
        return 'local_storage_key.onboarding_complete';

    }
  }
}
