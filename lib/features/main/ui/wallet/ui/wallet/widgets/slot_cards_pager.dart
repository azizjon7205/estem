import 'package:estem/core/router/router.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/features/main/ui/wallet/ui/transfer/bloc/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/core/styles/app_colors.dart';
import '../../../domain/entities/wallet_card.dart';
import 'item_wallet_card.dart';

class SlotCardsPager extends StatefulWidget {
  const SlotCardsPager({super.key, required this.cards});

  final List<WalletCard> cards;

  @override
  State<SlotCardsPager> createState() => _SlotCardsPagerState();
}

class _SlotCardsPagerState extends State<SlotCardsPager> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.0,
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: widget.cards.length,
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              final walletCard = widget.cards[i];
              return ItemWalletCard(
                card: walletCard,
                onActionDone: () {
                  switch (walletCard.type) {
                    case WalletCardType.wallet:
                      navController.push(TransferRoute(
                        type: walletCard.type.transferType,
                        wallet: walletCard,
                      ));
                      break;
                    case WalletCardType.card:
                      navController.push(TransferRoute(
                        type: walletCard.type.transferType,
                        wallet: widget.cards.firstWhere(
                            (element) => element.type == WalletCardType.wallet),
                        card: walletCard,
                      ));
                      break;
                  }
                },
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.cards.length, // Change this to your item count
          effect: const ExpandingDotsEffect(
            activeDotColor: AppColors.primary,
            dotColor: Color(0xFFC6CBD2),
            dotHeight: 4,
            dotWidth: 10,
            spacing: 4,
            expansionFactor: 2,
          ),
        ),
      ],
    );
  }
}
