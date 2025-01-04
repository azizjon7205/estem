import '/core/network/api_service.dart';
import '/core/utils/constants/app_constants.dart';
import '/core/utils/injections.dart';
import '/shared/data/data_sources/local/app_shared_prefs.dart';

initAppInjections() {
  // Register shared prefs
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
  sl.registerLazySingleton<ApiService>(
      () => ApiService(baseUrl: apiUrl, sharedPrefs: sl()));
}
