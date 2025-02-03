import 'package:easy_localization/easy_localization.dart';
import '/core/helper/helper.dart';
import '/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/wallet_card.dart';

class ItemWalletCard extends StatelessWidget {
  const ItemWalletCard({
    super.key,
    required this.card,
    required this.onActionDone,
  });

  final WalletCard card;
  final VoidCallback onActionDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(
        top: 20,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(
            card.type.bgImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card.cardName,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                'assets/icons/ic_logo.png',
                width: 28,
                height: 28,
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
              )
            ],
          ),
          const Height(14.0),
          Text(
            'wallet.available_balance'.tr(),
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            '${Helper.formatCurrency(card.balance)} uzs',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 2,
            ),
          ),
          const Height(12.0),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onActionDone,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white.withValues(alpha: 0.12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4AD2E4).withValues(alpha: 0.0818),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Text(
                  card.type.actionName.tr(),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
