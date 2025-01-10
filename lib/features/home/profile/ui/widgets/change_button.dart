import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/styles/app_colors.dart';

class ChangeButton extends StatelessWidget {
  const ChangeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 28,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/ic_change.png'),
            const SizedBox(
              width: 6,
            ),
            Text(
              'CHANGE',
              style: GoogleFonts.inter(
                  fontSize: 10,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
