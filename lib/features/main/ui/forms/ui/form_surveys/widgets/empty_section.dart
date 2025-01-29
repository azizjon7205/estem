import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';

class EmptySection extends StatelessWidget {
  const EmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 200,
              minHeight: 200,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFDADADA).withValues(alpha: 0.1),
            ),
            child: Image.asset('assets/images/im_empty.png'),
          ),
          const Height(22.0),
          Text(
            'forms.empty_title'.tr(),
            style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                height: 29.05 / 24),
          ),
          const Height(12.0),
          Text(
            'forms.empty_message'.tr(),
            style: GoogleFonts.inter(
                color: const Color(0xFF747688),
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                height: 25 / 16),
          ),
        ],
      ),
    );
  }
}
