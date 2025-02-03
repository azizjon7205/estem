import '../../../domain/entities/wallet_card.dart';

class TransferState {
  TransferType type;
  double? minimumAmount;
  double amount;
  WalletCard wallet;
  WalletCard? card;
  List<WalletCard>? cards;
  double address1Top;
  double address2Top;

  TransferState({
    required this.type,
    this.minimumAmount,
    this.amount = 0.0,
    required this.wallet,
    this.card,
    this.cards,
    this.address1Top = 20,
    this.address2Top = 160
  });

  TransferState copyWith({
    TransferType? type,
    double? minimumAmount,
    double? amount,
    WalletCard? wallet,
    WalletCard? card,
    List<WalletCard>? cards,
  }) {
    return TransferState(
      type: type ?? this.type,
      wallet: wallet ?? this.wallet,
      card: card ?? this.card,
      cards: cards ?? this.cards,
      minimumAmount: minimumAmount ?? this.minimumAmount,
      amount: amount ?? this.amount,
    );
  }
}

enum TransferType { topUp, withdraw }

extension WalletCartTypeTransfer on WalletCardType {
  TransferType get transferType {
    switch (this) {
      case WalletCardType.wallet:
        return TransferType.topUp;
      case WalletCardType.card:
        return TransferType.withdraw;
    }
  }
}
