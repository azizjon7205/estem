import 'package:auto_route/annotations.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/features/onboarding/domain/entities/onboarding.dart';
import 'package:estem/shared/data/data_sources/local/app_shared_prefs.dart';
import 'package:estem/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/injections.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Onboarding onboarding;
  PageController controller = PageController();
  int currentIndex = 0;

  late final AppSharedPrefs prefs;

  @override
  void initState() {
    prefs = sl();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        systemNavigationBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.dark, // Black icons
        statusBarBrightness: Brightness.light, // For iOS compatibility
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top], // Keep only the status bar visible
    );
    onboarding = dummyOnboarding().first;
    super.initState();
  }

  void onPositionChanged(int value) {
    setState(() {
      currentIndex = value;
      onboarding = dummyOnboarding()[currentIndex];
    });
  }

  @override
  void dispose() {
    print("ON dispose");
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
      body: PageView.builder(
        controller: controller,
        onPageChanged: onPositionChanged,
        itemCount: dummyOnboarding().length,
          itemBuilder: (context, i) {
            final onboarding = dummyOnboarding()[i];
            return Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: Image.asset(
                onboarding.image,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            );
          }),
      bottomNavigationBar: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.3,
            maxHeight: MediaQuery.of(context).size.height * 0.36),
        padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 40.0),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48.0),
                topRight: Radius.circular(48.0),),),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 68,
              child: Text(
                onboarding.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Handle text overflow
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    color: AppColors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    height: 34 / 22),
              ),
            ),
            const Height(16.0),
            Text(
              onboarding.subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  height: 25.0 / 15.0),
            ),
            // const Height(48.0),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    prefs.setOnboarding(true);
                    navController.push(const LoginRoute());
                  },
                  child: Text(
                    'onboarding.skip'.tr(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: AppColors.white.withValues(alpha: 0.5),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        height: 34.0 / 18.0),
                  ),
                ),
                DotsIndicator(
                  position: currentIndex,
                  dotsCount: 3,
                  decorator: DotsDecorator(
                      spacing: const EdgeInsets.all(4),
                      activeColor: AppColors.white,
                      color: AppColors.white.withValues(alpha: 0.5),
                      size: const Size(8.0, 8.0),
                      shape: const CircleBorder()),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (currentIndex != dummyOnboarding().length-1) {
                      controller.jumpToPage(currentIndex+1);

                      // controller.animateToPage(currentIndex+1, duration: Duration(), curve: ElasticInOutCurve());
                      // onPositionChanged(currentIndex+1);
                    } else {
                      prefs.setOnboarding(true);
                      navController.push(const LoginRoute());
                    }
                  },
                  child: Text(
                    'onboarding.next'.tr(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        height: 34.0 / 18.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}


