import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/sizes.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Height(24.0),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Text(
              'auth.verification'.tr(),
              style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 29.05 / 24,
                  color: const Color(0xff120D26)),
            ),
          ),
          const Height(13.0),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 40),
            child: Text(
              'auth.verification_message'.tr(args: ['+998 99 111 22 33']),
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 25 / 15,
                  color: const Color(0xff120D26)),
            ),
          ),
          const Height(27.0),
          Center(
            child: Pinput(
              defaultPinTheme: PinTheme(
                  textStyle: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 29.05 / 24,
                      color: const Color(0xff120D26)),
                  width: 55,
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: AppColors.gray))),
              focusedPinTheme: PinTheme(
                  width: 55,
                  height: 55,
                  textStyle: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 24 / 20,
                      color: const Color(0xff120D26)),
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: AppColors.primary))),
              errorPinTheme: PinTheme(
                  width: 55,
                  height: 55,
                  textStyle: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 29.05 / 24,
                      color: const Color(0xff120D26)),
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: AppColors.red))),
              length: 4,
            ),
          ),
          const Height(40.0),
          AppElevatedButton(
            onTap: () {},
            label: 'base.actions.continue'.tr().toUpperCase(),
            margin: const EdgeInsets.symmetric(horizontal: 52.0),
          ),
          const Height(24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'auth.resend'.tr(),
                style: GoogleFonts.inter(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  height: 25 / 15,
                  color: const Color(0xff120D26),
                ),
              ),
              const Width(16.0),
              Text(
                '00:20',
                style: GoogleFonts.inter(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  height: 25 / 15,
                  color: AppColors.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
