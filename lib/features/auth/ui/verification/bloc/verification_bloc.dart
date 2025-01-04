import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_autofill/otp_autofill.dart';

import '../../../domain/use_cases/verification_use_case.dart';
import 'verification_event.dart';
import 'verification_state.dart';

class SampleStrategy extends OTPStrategy {

  @override
  Future<String> listenForCode() {
    return Future.delayed(
      const Duration(seconds: 4),
          () => 'Your code is 1111',
    );
  }
}

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final VerificationUseCase _useCase;

  late final otpController;
  final otpInteractor = OTPInteractor();

  VerificationBloc(this._useCase, String phone)
      : super(VerificationState(phone: phone, remainingTime: 60, isResendEnabled: false, isOtpValid: false)) {
    on<CountdownChange>(_onCountDownChange);
    on<ResendSmsCode>(_onResendSmsCode);
    on<CompleteSmsCode>(_onCompleteSmsCode);
    on<ChangeSmsCode>(_onChangeSmsCode);
    on<VerifySmsCode>(_onVerifySmsCode);


    // add(StartResendCountdown());

    otpController = OTPTextEditController(
      codeLength: 4,
      onCodeReceive: (code) {
        print('Your Application receive code - $code');
      },
      otpInteractor: otpInteractor,
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{4})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [
          SampleStrategy(),
        ],
      );


  }

  void startTimer() async {
    int remainingTime = 60;
    // add(CountdownChange(remainingTime, false));
    while(remainingTime > 0) {
      // print("from state ______${state.remainingTime}");
      await Future.delayed(const Duration(seconds: 1));
      remainingTime--;
      add(CountdownChange(remainingTime, false));
    }
    add(CountdownChange(remainingTime, true));

  }

  void _onCountDownChange(CountdownChange event, Emitter<VerificationState> emit) async {
    // print("from strer ______${event.remainingTime} -- ${event.isResendEnabled}");

    emit(state.copyWith(remainingTime: event.remainingTime, isResendEnabled: event.isResendEnabled,));


  }


  _onResendSmsCode(
      ResendSmsCode event, Emitter<VerificationState> emit) {
    otpController.clear();
    emit(state.copyWith(remainingTime: 60, isResendEnabled: false, isOtpValid: false, isSuccess: null, errorMessage: ''));
    startTimer();

  }

  _onCompleteSmsCode(CompleteSmsCode event, Emitter<VerificationState> emit) {
    if (event.code.isNotEmpty) emit(state.copyWith(isOtpValid: true, code: event.code));
  }

  _onChangeSmsCode(ChangeSmsCode event, Emitter<VerificationState> emit) {
    if (event.code.isNotEmpty && event.code.length == 4) {
      emit(state.copyWith(isOtpValid: true, code: event.code));
    } else {
      emit(state.copyWith(isOtpValid: false, code: event.code, isSuccess: null, errorMessage: ''));
    }
  }

  _onVerifySmsCode(VerifySmsCode event, Emitter<VerificationState> emit) async {
    emit(state.copyWith(isLoading: true, isSuccess: null, errorMessage: ''));
    try {
      final result = await _useCase.call(state.phone, event.code);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {

      print('bloc error: ${e.toString()}');
      emit(state.copyWith(
          isLoading: false, errorMessage: e.toString(), isSuccess: false));
    }
  }

  @override
  Future<void> close() {
    otpController.dispose(); // Dispose of the controller
    return super.close();
  }
}
