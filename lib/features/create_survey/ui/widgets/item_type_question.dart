import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';

class ItemTypeQuestion extends StatelessWidget {
  const ItemTypeQuestion({
    super.key,
    required this.iconPath,
    required this.color,
    required this.title,
    this.onTap,
  });

  final String iconPath;
  final Color color;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              width: 64,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.25),
                    offset: const Offset(0, 8.67),
                    blurRadius: 21.68,
                  )
                ],
              ),
              child: SvgPicture.asset(iconPath),
            ),
            SizedBox(
              height: 44,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.inter(
                    color: AppColors.textStrong,
                    height: 16 / 14,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
