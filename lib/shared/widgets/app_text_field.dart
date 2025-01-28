import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.value,
      this.label,
      this.contentPadding,
      this.keyboardType,
      this.maxLines = 1,
      this.onChanged,
      this.inputFormatters,
      this.hint,
      this.errorText,
      this.isReadOnly = false,
      this.controller,
      this.textInputAction,
      this.focusNode});

  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final String? value;
  final int maxLines;
  final String? hint;
  final String? label;
  final bool isReadOnly;
  final String? errorText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: value,
      style: const TextStyle(
        fontSize: 14.0,
        height: 24 / 14,
        color: AppColors.textStrong,
      ),
      cursorColor: AppColors.primary,
      readOnly: isReadOnly,
      enabled: !isReadOnly,
      textInputAction: textInputAction,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        errorText: errorText,
        contentPadding: contentPadding,
        isDense: contentPadding != null,
      ),
    );
  }
}
