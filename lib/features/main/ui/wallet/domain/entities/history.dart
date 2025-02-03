import '/core/helper/helper.dart';

class History {
  dynamic id;
  DateTime date;
  HistoryType type;
  double amount;

  History({
    this.id,
    required this.date,
    required this.type,
    required this.amount,
  });

  String get formattedAmount {
    switch(type) {
      case HistoryType.income:
        return '+${Helper.formatCurrency(amount)}uzs';
      case HistoryType.outcome:
        return '-${Helper.formatCurrency(amount)}uzs';
    }
  }

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      date: DateTime.parse(json['date']),
      type: json['type'].toString().historyType,
      amount: double.tryParse(json['amount'].toString()) ?? 0.0,
    );
  }
}

enum HistoryType { income, outcome }

extension HistoryTypeStrings on HistoryType {
  String get label {
    switch (this) {
      case HistoryType.income:
        return 'history.income';
      case HistoryType.outcome:
        return 'history.outcome';
    }
  }

  String get icon {
    switch(this) {
      case HistoryType.income:
        return 'assets/icons/ic_arrow_up.svg';
      case HistoryType.outcome:
        return 'assets/icons/ic_arrow_down.svg';
    }
  }

  int get color {
    switch(this) {
      case HistoryType.income:
        return 0xFF29D697;
      case HistoryType.outcome:
        return 0xFFF0635A;
    }
  }
}

extension HistoryTypeCheck on String {
  HistoryType get historyType {
    switch (this) {
      case 'income':
        return HistoryType.income;
      case 'outcome':
        return HistoryType.outcome;
      default:
        return HistoryType.income;
    }
  }
}
