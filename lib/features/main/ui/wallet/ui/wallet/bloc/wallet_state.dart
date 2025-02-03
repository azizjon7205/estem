
import '../../../domain/entities/history.dart';
import '../../../domain/entities/wallet_card.dart';

class WalletState {
  bool isLoading;
  List<WalletCard> cards;
  List<History> history;

  WalletState({
    this.isLoading = false,
    this.cards = const [],
    this.history = const [],
  });
}
