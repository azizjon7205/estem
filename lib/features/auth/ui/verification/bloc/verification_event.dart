abstract class VerificationEvent {}

class CountdownChange extends VerificationEvent {
  final int remainingTime;
  final bool isResendEnabled;

  CountdownChange(this.remainingTime, this.isResendEnabled);
}

class StopResendCountdown extends VerificationEvent {}

class VerifySmsCode extends VerificationEvent {
  String code;

  VerifySmsCode(this.code);
}

class CompleteSmsCode extends VerificationEvent {
  String code;

  CompleteSmsCode(this.code);
}

class ChangeSmsCode extends VerificationEvent {
  String code;

  ChangeSmsCode(this.code);
}

class ResendSmsCode extends VerificationEvent {

}