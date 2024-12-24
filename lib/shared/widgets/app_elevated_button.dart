import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton(
      {super.key,
      this.onTap,
      this.margin,
      required this.label,
      this.hasSuffixNext = true});

  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final String label;
  final bool hasSuffixNext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x006f7ec9).withOpacity(0.25),
                  blurRadius: 35,
                  offset: const Offset(0, 10))
            ]),
        child: Row(
          children: [
            if (hasSuffixNext) const Width(58.0),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.white,
                  fontSize: 16.0,
                  height: 19.36 / 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (hasSuffixNext)
              Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.all(14.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff3d56f0)),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 13,
                  color: AppColors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
