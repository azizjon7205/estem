import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/core/utils/injections.dart';
import '/shared/widgets/sizes.dart';
import 'bloc/verification_bloc.dart';
import 'widgets/otp_actions.dart';
import 'widgets/otp_field.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
      ),
      body: BlocProvider(
        create: (context) => VerificationBloc(sl(), phoneNumber)..startTimer(),
        child: Column(
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
                'auth.verification_message'.tr(args: ['+998 $phoneNumber']),
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 25 / 15,
                    color: const Color(0xff120D26)),
              ),
            ),
            const Height(27.0),
            const OtpField(),
            const Height(40.0),
            const OtpActions()
          ],
        ),
      ),
    );
  }
}
