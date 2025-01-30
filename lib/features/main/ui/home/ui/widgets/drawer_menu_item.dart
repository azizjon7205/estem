import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem(
      {super.key,
      required this.leadingPath,
      required this.label,
      required this.onTap});

  final String leadingPath;
  final String label;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          spacing: 14,
          children: [
            SvgPicture.asset(leadingPath),
            Text(
              label,
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 25 / 16),
            )
          ],
        ),
      ),
    );
  }
}
