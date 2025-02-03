import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/helper/helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/wallet_card.dart';
import '/shared/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWallet extends StatelessWidget {
  const ItemWallet({super.key, required this.wallet});

  final WalletCard wallet;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: AppContainer(
        // width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          spacing: 16.0,
          children: [
            SvgPicture.asset('assets/icons/ic_logo_1.svg'),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'wallet.available_balance'.tr(),
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      height: 18.0 / 14.0,
                    ),
                  ),
                  Text(
                    '${Helper.formatCurrency(wallet.balance)} uzs',
                    style: GoogleFonts.inter(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
