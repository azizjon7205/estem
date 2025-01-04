import 'package:estem/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<SubmitPhoneNumberEvent>(_onSubmitPhoneNumber);
  }

  void _onSubmitPhoneNumber(
      SubmitPhoneNumberEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result =
          await _loginUseCase.call(phoneNumberEditingController.text);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isSuccess: false, errorMessage: e.toString()));
    }
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<LoginState> emit) {
    final isPhoneNumberValid = _validatePhoneNumber(event.phone);
    emit(state.copyWith(
        phone: event.phone, isPhoneNumberValid: isPhoneNumberValid));
  }

  bool _validatePhoneNumber(String phone) {
    // Example pattern for username: must be alphanumeric and 5-15 chars long
    final pattern = RegExp(r'^[0-9 ]{12}$');
    return pattern.hasMatch(phone);
  }

  bool _validateUsername(String username) {
    // Example pattern for username: must be alphanumeric and 5-15 chars long
    final pattern = RegExp(r'^[a-zA-Z0-9]{5,15}$');
    return pattern.hasMatch(username);
  }

  bool _validatePassword(String password) {
    // Example: must be at least 8 chars, with one number and one special character
    final pattern = RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$');
    return pattern.hasMatch(password);
  }
}
