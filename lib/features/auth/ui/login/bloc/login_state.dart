
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String phone;
  final bool isLoading;
  final bool? isSuccess;
  final String? errorMessage;
  final bool isPhoneNumberValid;

  const LoginState({
    this.phone = '',
    this.isLoading = false,
    this.isSuccess,
    this.errorMessage,
    this.isPhoneNumberValid = false,
  });

  LoginState copyWith({
    String? phone,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? isPhoneNumberValid,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [phone, isLoading, isSuccess, errorMessage, isPhoneNumberValid];
}
