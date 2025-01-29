import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildDetailCard extends StatelessWidget {
  const BuildDetailCard({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow:  [
          BoxShadow(
            color: AppColors.gray.withValues(alpha: 0.3), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 10, // Blur radius
            offset: const Offset(0, 5), // Changes position of shadow
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: ListTile(
            title: Text(
              title,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary),
            ),
            subtitle: Text(
              value,
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
