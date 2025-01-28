import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';

class SheetStatusTile extends StatelessWidget {
  const SheetStatusTile(
      {super.key, required this.active, required this.onStatusChanged});

  final bool active;
  final Function(bool) onStatusChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.0,
      children: [
        Container(
          width: 48.0,
          height: 48.0,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SvgPicture.asset('assets/icons/ic_status.svg'),
        ),
        Expanded(
          child: Text(
            'base.status.label'.tr(),
            style: GoogleFonts.inter(
              color: AppColors.textStrong,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 34 / 16,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: active
                ? AppColors.green.withValues(alpha: 0.2)
                : AppColors.red.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Text(
            active ? 'base.status.active'.tr() : 'base.status.inactive'.tr(),
            style: GoogleFonts.inter(
              color: active ? AppColors.green : AppColors.red,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 12 / 10,
            ),
          ),
        ),
        SizedBox(
            height: 20,
            width: 40,
            child: Switch(
              // materialTapTargetSize: MaterialTapTargetSize.padded,
              // trackOutlineColor: WidgetStateProperty.all(AppColors.gray),
              // thumbColor: WidgetStateProperty.all(AppColors.white),
              // inactiveTrackColor: AppColors.gray,
              // activeTrackColor: AppColors.primary,
              // activeColor: AppColors.white,
              value: active,
              onChanged: onStatusChanged,
            ))
      ],
    );
  }
}
