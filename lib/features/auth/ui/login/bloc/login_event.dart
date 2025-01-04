abstract class LoginEvent {}

class SubmitPhoneNumberEvent extends LoginEvent {

  SubmitPhoneNumberEvent();
}

class PhoneNumberChanged extends LoginEvent {
  final String phone;

  PhoneNumberChanged(this.phone);
}