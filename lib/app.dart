import 'package:easy_localization/easy_localization.dart';
import 'package:estem/features/onboarding/ui/pages/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/router/router.dart';
import 'core/styles/app_theme.dart';

class EstemApp extends StatelessWidget {
  const EstemApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Black icons
        statusBarBrightness: Brightness.light, // For iOS compatibility
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top], // Keep only the status bar visible
    );
    return MaterialApp.router(
      locale: context.locale,
      localizationsDelegates: [
        ...context.localizationDelegates
      ],
      supportedLocales: context.supportedLocales,
      title: 'Estem App',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context),
      routerDelegate: navController.delegate(
        placeholder: (context) => Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/im_background.png'), fit: BoxFit.cover),
            ),
          ),
        )
      ),
      routeInformationParser: navController.defaultRouteParser(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(context),
      title: 'Estem App',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: LanguageScreen(),
    );
  }

}