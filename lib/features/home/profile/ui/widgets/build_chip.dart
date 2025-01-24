import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BuildChip extends StatelessWidget{
  const BuildChip( {  // yaxshilab qarab yozib chiqih kerak
    super.key, required this.label, required this.color,
});

  final String label;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: GoogleFonts.inter(fontSize: 13, color: AppColors.white),),
      backgroundColor: color,
      labelStyle: const TextStyle(color: Colors.blue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
    );
  }
}