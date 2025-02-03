import 'package:bloc/bloc.dart';
import 'package:estem/features/main/ui/wallet/domain/entities/history.dart';

import '../../../domain/entities/wallet_card.dart';
import 'wallet_event.dart';
import 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc()
      : super(WalletState(
          cards: [
            WalletCard(
              cardName: 'cardName',
              balance: 123456,
              type: WalletCardType.wallet,
            ),
            WalletCard(
              cardName: 'cardName',
              balance: 123456,
              type: WalletCardType.card,
              cardNumber: '8600 **** 1234'
            ),

          ],
    history: [
      History(date: DateTime.now(), type: HistoryType.income, amount: 500),
      History(date: DateTime.now(), type: HistoryType.outcome, amount: 500),
      History(date: DateTime.now(), type: HistoryType.income, amount: 500),
      History(date: DateTime.now(), type: HistoryType.outcome, amount: 500),
      History(date: DateTime.now(), type: HistoryType.income, amount: 500),
    ]
        )) {}
}
