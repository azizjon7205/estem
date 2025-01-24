import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/shared/data/data_sources/local/app_shared_prefs.dart';
import 'package:estem/shared/models/app_lang.dart';
import '../../../../core/utils/injections.dart';
import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/shared/models/language.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/item_language_selector.dart';
import '/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  final AppSharedPrefs prefs = sl();
  late AppLang currentLanguage;

  @override
  void initState() {
    currentLanguage = prefs.getLang();
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
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.white, // Transparent status bar
    //     systemNavigationBarColor: Colors.white,
    //     statusBarIconBrightness: Brightness.dark, // Black icons
    //     statusBarBrightness: Brightness.light, // For iOS compatibility
    //   ),
    // );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/im_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0)
                  .copyWith(top: 80),
              child: Image.asset(
                'assets/images/im_logo.png',
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ItemLanguageSelector(
                        language: dataLanguages()[i],
                        isSelected: currentLanguage == dataLanguages()[i].lang,
                        onSelect: (value) {
                          setState(() {
                            currentLanguage = value.lang;
                          });
                        },
                      ),
                    ),
                    separatorBuilder: (context, i) => const Height(16.0),
                    itemCount: dataLanguages().length,
                  )
                ],
              ),
            ),
            AppElevatedButton(
              onTap: () {
                context.setLocale(currentLanguage.locale);
                prefs.setLang(currentLanguage);
                navController.push(const OnboardingRoute());
              },
              label: 'base.actions.continue'.tr().toUpperCase(),
              margin: const EdgeInsets.symmetric(horizontal: 50.0)
                  .copyWith(bottom: 56.0),
            )
          ],
        ),
      ),
    );
  }
}
