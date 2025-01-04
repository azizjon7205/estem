import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemRequired extends StatelessWidget {
  const ItemRequired({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: AppColors.red.withValues(alpha: 0.2)),
      child: Text(
        'question.required'.tr(),
        style: GoogleFonts.inter(
            color: AppColors.red,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 12.1 / 10),
      ),
    );
  }
}
