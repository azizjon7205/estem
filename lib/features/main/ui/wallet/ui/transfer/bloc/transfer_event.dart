abstract class TransferEvent {}

class OnSwapTransfer extends TransferEvent {

}

class OnAmountChanged extends TransferEvent {
  double amount;

  OnAmountChanged(this.amount);
}