import 'package:equatable/equatable.dart';

class VerificationState extends Equatable {
  final String phone;
  final String? code;
  final bool isLoading;
  final bool? isSuccess;
  final String errorMessage;
  final String? otpErrorMessage;
  final bool isOtpValid;
  final int remainingTime;
  final bool isResendEnabled;

  const VerificationState({
    required this.phone,
    this.code,
    this.isLoading = false,
    this.isSuccess,
    this.errorMessage = '',
    this.otpErrorMessage,
    this.isOtpValid = false,
    this.remainingTime = 0,
    this.isResendEnabled = false,
  });

  VerificationState copyWith({
    String? code,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    String? otpErrorMessage,
    bool? isOtpValid,
    int? remainingTime,
    bool? isResendEnabled,
  }) {
    return VerificationState(
      phone: phone,
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      otpErrorMessage: otpErrorMessage ?? this.otpErrorMessage,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      remainingTime: remainingTime ?? this.remainingTime,
      isResendEnabled: isResendEnabled ?? this.isResendEnabled,
    );
  }

  @override
  List<Object?> get props => [phone, code, isLoading, isSuccess, errorMessage, remainingTime, isResendEnabled];
}
