import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/sizes.dart';
import '../bloc/verification_bloc.dart';
import '../bloc/verification_event.dart';
import '../bloc/verification_state.dart';

class OtpActions extends StatelessWidget {
  const OtpActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationBloc, VerificationState>(
      listenWhen: (previous, current) {
        return previous.isSuccess != current.isSuccess ||
            previous.errorMessage != current.errorMessage;
      },
      listener: (context, state) {
        print('state is : ${state.isSuccess} error: ${state.errorMessage}');
        if (state.isSuccess == false && state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
        if (state.isSuccess == true) {
          navController.replaceAll([const MainRoute()]);

          // navController.push(const HomeRoute());
        }
      },
      builder: (context, state) => Column(
        children: [
          AppElevatedButton(
            onTap: () {
              context.read<VerificationBloc>().add(VerifySmsCode(state.code!));
            },
            showLoader: state.isLoading,
            enabled: state.isOtpValid && !state.isResendEnabled,
            label: 'base.actions.continue'.tr().toUpperCase(),
            margin: const EdgeInsets.symmetric(horizontal: 52.0),
          ),
          const Height(24.0),
          state.isResendEnabled
              ? GestureDetector(
                  onTap: () {
                    context.read<VerificationBloc>().add(ResendSmsCode());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'auth.resend'.tr(),
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        height: 25 / 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'auth.resend_in'.tr(),
                      style: GoogleFonts.inter(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        height: 25 / 15,
                        color: const Color(0xff120D26),
                      ),
                    ),
                    const Width(6.0),
                    Text(
                      '00:${state.remainingTime.toString().padLeft(2, '0')}',
                      style: GoogleFonts.inter(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        height: 25 / 15,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
