import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.contentPadding,
      this.keyboardType, this.maxLines = 1,
      this.hint, this.isReadOnly = false, this.controller});

  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? hint;
  final bool isReadOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: contentPadding,
        isDense: contentPadding != null,
      ),
    );
  }
}
