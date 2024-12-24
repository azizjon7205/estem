import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/im_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0)
                  .copyWith(top: 75),
              child: Image.asset(
                'assets/icons/ic_logo.png',
                width: 70,
              ),
            ),
            const Height(4.0),
            Image.asset(
              'assets/images/im_logo.png',
              height: 32,
            ),
            const Height(75.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'auth.sign_in'.tr(),
                style: GoogleFonts.inter(
                    color: const Color(0xFF120D26),
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    height: 29.05 / 24.0),
              ),
            ),
            const Height(22.0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 56.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: const Center(
                    child: Text(
                      '+998',
                      style: TextStyle(
                          color: Color(0xFF120D26),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          height: 23 / 14),
                    ),
                  ),
                ),
                const Width(8.0),
                Expanded(
                  child: AppTextField(
                    hint: '99 111 22 33',
                    contentPadding: const EdgeInsets.all(16.0),
                  ),
                ),
              ],
            ),
            const Height(40.0),
            AppElevatedButton(
              onTap: () {},
              label: 'auth.sign_in'.tr().toUpperCase(),
              margin: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(bottom: 56.0),
            )
          ],
        ),
      ),
    );
  }
}
