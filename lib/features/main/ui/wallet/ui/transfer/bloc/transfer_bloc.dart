import 'package:bloc/bloc.dart';

import '../../../domain/entities/wallet_card.dart';
import 'transfer_event.dart';
import 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc({
    required TransferType type,
    required WalletCard wallet,
    WalletCard? card,
  }) : super(TransferState(
          type: type,
          wallet: wallet,
          card: card,
          minimumAmount: 50000,
        )) {
    on<OnSwapTransfer>(_onSwapTransferType);
    on<OnAmountChanged>(_onAmountChanged);
  }

  void _onSwapTransferType(OnSwapTransfer event, Emitter<TransferState> emit) {
    print('Transfer body >>>>>> ${state.type}');
    emit(state.copyWith(
      type: state.type == TransferType.withdraw
          ? TransferType.topUp
          : TransferType.withdraw,
    ));
    print('Transfer body new >>>>>> ${state.type}');
  }

  void _onAmountChanged(OnAmountChanged event, Emitter<TransferState> emit) {
    emit(state.copyWith(amount: event.amount));
  }
}
