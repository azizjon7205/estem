import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/history.dart';

class ItemWalletHistory extends StatelessWidget {
  const ItemWalletHistory({super.key, required this.history});

  final History history;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        SvgPicture.asset(history.type.icon),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                history.type.label.tr(),
                style: GoogleFonts.inter(
                  color: const Color(0xFF0D0C26),
                  fontSize: 15,
                  height: 25 / 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                Helper.dateFormatWithMonth(history.date),
                style: GoogleFonts.inter(
                  color: const Color(0xFF706E8F),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          decoration: BoxDecoration(
            color: Color(history.type.color).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Text(
            history.formattedAmount,
            style: GoogleFonts.inter(
              color: Color(history.type.color),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
