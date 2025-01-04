import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_injections.dart';
import 'log/app_logger.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  // await initTempDirectoryInjections();
  await initAppInjections();
  await initDioInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

// initTempDirectoryInjections() async {
//   sl.registerSingletonAsync<Directory>(() async {
//     return await getTemporaryDirectory();
//   });
//   await sl.isReady<Directory>();
// }

Future<void> initDioInjections() async {
  initRootLogger();
}
