import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/features/main/ui/wallet/ui/wallet/widgets/slot_cards_pager.dart';
import 'package:estem/features/main/ui/wallet/ui/wallet/widgets/slot_wallet_chart.dart';
import 'package:estem/features/main/ui/wallet/ui/wallet/widgets/slot_wallet_history.dart';
import 'package:estem/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wallet_bloc.dart';
import '../bloc/wallet_state.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletBloc, WalletState>(
      builder: (context, state) => state.isLoading
          ? const Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            )
          : ListView(
              children: [
                state.cards.isNotEmpty
                    ? SlotCardsPager(
                        cards: state.cards,
                      )
                    : Container(),
                const Height(16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SlotWalletChart(),
                ),
                if (state.history.isNotEmpty) ...[
                  const Height(16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SlotWalletHistory(histories: state.history),
                  ),
                ],
                const Height(36.0),
              ],
            ),
      listener: (context, state) {},
    );
  }
}
