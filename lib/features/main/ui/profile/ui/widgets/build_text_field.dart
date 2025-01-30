import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextField extends StatelessWidget{
  const BuildTextField({super.key,  required this.controller,  this.isNumeric = false, required this.label});
  final String label;
  final TextEditingController controller;
  final bool isNumeric;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary),),
          const SizedBox(height: 8,),
          TextFormField(
            controller: controller,
            keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
            validator: (value) {
              if(value == null || value.isEmpty){
                return '$label is required';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.gray),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey, // Border color when not focused
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.primary, // Border color when focused
                  width: 2,
                ),
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}