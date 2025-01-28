import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';

class DraftAlertContent extends StatelessWidget {
  const DraftAlertContent({
    super.key,
    required this.onYesTap,
    required this.onNoTap,
  });

  final VoidCallback onYesTap;
  final VoidCallback onNoTap;

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
            Image.asset('assets/images/im_draft.png'),
            const Height(30),
            Text(
              'create.draft'.tr(),
              style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Height(10),
            Text(
              'create.draft_message'.tr(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.textSub,
                fontSize: 16,
                height: 25 / 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Height(48),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 58),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFFE5E5E5)),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    onPressed: onNoTap,
                    child: Text(
                      'base.no'.tr().toUpperCase(),
                      style: GoogleFonts.inter(
                        color: AppColors.textStrong,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    onPressed: onYesTap,
                    child: Text(
                      'base.yes'.tr().toUpperCase(),
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
