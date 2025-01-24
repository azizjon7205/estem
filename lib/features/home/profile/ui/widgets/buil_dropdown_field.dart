import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildDropdownField extends StatelessWidget {
  const BuildDropdownField(
      {super.key,
      required this.label,
      required this.selectedValue,
      required this.options,
      required this.onChanged});

  final String label;
  final String selectedValue;
  final List<String> options;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primary),),
          const SizedBox(height: 8,),
          DropdownButtonFormField<String>(
            value: selectedValue,
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16
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
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(
                  option,
                  style: GoogleFonts.inter(fontSize: 14),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
