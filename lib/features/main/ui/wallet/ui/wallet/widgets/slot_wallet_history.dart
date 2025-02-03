import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';
import '../../../domain/entities/history.dart';
import 'item_wallet_history.dart';

class SlotWalletHistory extends StatelessWidget {
  const SlotWalletHistory({super.key, required this.histories});

  final List<History> histories;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'wallet.history'.tr(),
          style: GoogleFonts.inter(
              color: AppColors.textStrong,
              fontSize: 16,
              height: 34 / 16,
              fontWeight: FontWeight.w500),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) => ItemWalletHistory(history: histories[i]),
          separatorBuilder: (context, i) => const Height(12.0),
          itemCount: histories.length,
        )
      ],
    );
  }
}
