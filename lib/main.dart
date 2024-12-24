import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/shared/models/app_lang.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  debugPrint('App Initialized');
  runApp(
    EasyLocalization(
      supportedLocales: AppLang.values.map((e) => e.locale).toList(),
      fallbackLocale: AppLang.english.locale,
      startLocale: AppLang.english.locale,
      path: 'assets/locales',
      child: DevicePreview(
          enabled: !kReleaseMode && false,
          builder: (context) =>  EstemApp()),
    ),
  );
}
