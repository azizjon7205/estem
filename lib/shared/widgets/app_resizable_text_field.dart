import 'package:estem/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppResizableTextField extends StatelessWidget {
  const AppResizableTextField(
      {super.key,
      this.contentPadding,
      this.keyboardType, this.maxLines = 1,
        this.onChanged,
        this.inputFormatters,
      this.hint, this.isReadOnly = false, this.controller, this.focusNode});

  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? hint;
  final bool isReadOnly;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: 100
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        controller: controller,
        focusNode: focusNode,
        expands: true,
        maxLines: null,
        cursorColor: AppColors.primary,
        readOnly: isReadOnly,
        onChanged: onChanged,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: contentPadding,
          isDense: contentPadding != null,
        ),
      ),
    );
  }
}
