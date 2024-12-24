import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/shared/models/language.dart';
import 'package:estem/shared/widgets/app_elevated_button.dart';
import 'package:estem/shared/widgets/item_language_selector.dart';
import 'package:estem/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
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
                        isSelected: i % 2 != 0,
                        onSelect: (value) {},
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
