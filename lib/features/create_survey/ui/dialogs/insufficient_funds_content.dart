import 'package:easy_localization/easy_localization.dart';
import 'package:estem/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';

class InsufficientFundsContent extends StatelessWidget {
  const InsufficientFundsContent({super.key, this.onContinueTap});

  final VoidCallback? onContinueTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/im_fill_balance.png'),
          const Height(30),
          Text(
            'create.insufficient_funds'.tr(),
            style: GoogleFonts.inter(
              color: AppColors.textStrong,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Height(24),
          Text(
            'create.insufficient_message'.tr(),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: AppColors.textSub,
              fontSize: 16,
              height: 25 / 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Height(48),
          AppElevatedButton(
            onTap: onContinueTap,
            label: 'base.actions.go_back'.tr().toUpperCase(),
          )
        ],
      ),
    );
  }
}
