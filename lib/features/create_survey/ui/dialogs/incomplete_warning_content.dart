import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';

class InCompleteWarningContent extends StatelessWidget {
  const InCompleteWarningContent({super.key, required this.onGoBackTap});

  final VoidCallback onGoBackTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.95,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/im_warning.png'),
            const Height(30),
            Text(
              'create.incomplete_question'.tr(),
              style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Height(24),
            Text(
              'create.incomplete_message'.tr(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.textSub,
                fontSize: 16,
                height: 25 / 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Height(48),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              onPressed: onGoBackTap,
              child: Text(
                'base.actions.go_back'.tr().toUpperCase(),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
