import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onTap,
    this.margin,
    required this.label,
    this.enabled = true,
    this.height = 58.0,
    this.showLoader = false,
    this.hasSuffixNext = true,
  });

  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final String label;
  final bool hasSuffixNext;
  final bool enabled;
  final bool showLoader;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        margin: margin,
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: enabled ? AppColors.primary : const Color(0xFFEEEEEF),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x006f7ec9).withValues(alpha: 0.25),
                blurRadius: 35,
                offset: const Offset(0, 10),
              )
            ]),
        child: Row(
          children: [
            if (hasSuffixNext) const Width(58.0),
            Expanded(
              child: showLoader
                  ? const Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : Text(
                      label,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color:
                            enabled ? AppColors.white : const Color(0xFF484646),
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: enabled ? const Color(0xff3d56f0) : AppColors.gray,
                ),
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
