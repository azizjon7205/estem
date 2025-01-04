import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCategoryHome extends StatelessWidget {
  const CardCategoryHome({
    super.key,
    this.onTap,
    required this.color,
    required this.prefixPath,
    required this.label,
  });

  final GestureTapCallback? onTap;
  final Color color;
  final String prefixPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2E2E4F).withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 6)
            )
          ]
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.0,
            children: [
              SizedBox(
                height: 18,
                width: 18,
                child: SvgPicture.asset(prefixPath),
              ),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  height: 25 / 15,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
