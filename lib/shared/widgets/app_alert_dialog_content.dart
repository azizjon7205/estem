import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';

class AppAlertDialogContent extends StatelessWidget {
  const AppAlertDialogContent({
    super.key,
    required this.onActionDone,
    required this.image,
    required this.title,
    this.message,
    required this.actionTitle,
  });

  final VoidCallback onActionDone;
  final String image;
  final String title;
  final String actionTitle;
  final String? message;

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
            Image.asset(image),
            const Height(30),
            Text(
              title,
              style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (message != null) ...[
              const Height(24),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.textSub,
                  fontSize: 16,
                  height: 25 / 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
            const Height(48),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 58),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              onPressed: onActionDone,
              child: Text(
                actionTitle,
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
