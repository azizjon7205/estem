import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/styles/app_colors.dart';

class FormItemOption extends StatelessWidget {
  const FormItemOption(
      {super.key,
      required this.hint,
      this.value,
      required this.onValueChanged,
        this.showSuffix = true,
        this.onRemove, this.leading});

  final String hint;
  final String? value;
  final Function(String) onValueChanged;
  final VoidCallback? onRemove;
  final Widget? leading;
  final bool showSuffix;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        if (leading != null)
          leading!,
        Expanded(
          child: TextFormField(
            initialValue: value,
            onChanged: onValueChanged,
            style: GoogleFonts.inter(
              color: AppColors.textStrong,
              height: 16.94 / 14,
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
            decoration: InputDecoration(
              isDense: true,
                hintText: hint,
                hintStyle: GoogleFonts.inter(
                    color: AppColors.secondary,
                    height: 16.94 / 14,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                contentPadding: EdgeInsets.zero,
                border: const UnderlineInputBorder(),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary),
              ),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.secondary),
              )
            ),
          ),
        ),
        if (showSuffix)
          GestureDetector(
          onTap: onRemove,
          behavior: HitTestBehavior.translucent,
          child: Container(
            height: 24,
            width: 24,
            padding: const EdgeInsets.all(2.0),
            child: SvgPicture.asset(
              'assets/icons/ic_close.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xFF29253C), BlendMode.srcIn),
            ),
          ),
        )
      ],
    );
  }
}
