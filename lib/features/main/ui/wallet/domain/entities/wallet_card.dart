class WalletCard {
  dynamic id;
  String cardName;
  double balance;
  WalletCardType type;
  String? cardNumber;

  WalletCard({
    this.id,
    required this.cardName,
    required this.balance,
    required this.type,
    this.cardNumber,
  });

  factory WalletCard.fromJson(Map<String, dynamic> json) {
    return WalletCard(
      id: json['id'],
      cardName: json['card_name'],
      balance: double.tryParse(json['balance']) ?? 0.0,
      type: json['type'].toString().cardType,
      cardNumber: json['card_number']
    );
  }
}

enum WalletCardType {
  wallet,
  card
}

extension WalletCardActions on WalletCardType {
  String get actionName {
    switch(this) {
      case WalletCardType.wallet:
        return 'wallet.top_up';
      case WalletCardType.card:
        return 'wallet.withdraw';
    }
  }

  String get bgImage {
    switch(this) {
      case WalletCardType.wallet:
        return 'assets/images/im_bg_w.png';
      case WalletCardType.card:
        return 'assets/images/im_bg_c.png';
    }
  }
}

extension WalletCardExtension on String {
  WalletCardType get cardType {
    switch(this) {
      case 'wallet': return WalletCardType.wallet;
      case 'card': return WalletCardType.card;
      default: return WalletCardType.card;
    }
  }

}
