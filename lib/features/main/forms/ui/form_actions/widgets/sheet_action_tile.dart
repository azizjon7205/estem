import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';

class SheetActionTile extends StatelessWidget {
  const SheetActionTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.onTap});

  final Widget leading;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Row(
        spacing: 12.0,
        children: [
          leading,
          Text(
            title,
            style: GoogleFonts.inter(
              color: AppColors.textStrong,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 34 / 16,
            ),
          ),
        ],
      ),
    );
  }
}
