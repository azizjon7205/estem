import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '/core/styles/app_colors.dart';
import '../bloc/verification_bloc.dart';
import '../bloc/verification_event.dart';
import '../bloc/verification_state.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        controller: context.read<VerificationBloc>().otpController,
        onChanged: (value) {
          context.read<VerificationBloc>().add(ChangeSmsCode(value));
          print("onChanged: $value");
        },
        onCompleted: (value) {
          // context.read<VerificationBloc>().add(CompleteSmsCode(value));
          print("onCompleted: $value");
        },
        onSubmitted: (value) {
          context.read<VerificationBloc>().add(VerifySmsCode(value));
          print("onSubmitted: $value");
        },
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
    );
  }
}
