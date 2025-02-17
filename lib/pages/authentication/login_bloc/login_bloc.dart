import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_label_business_app/constants/texts_constants.dart';
import 'package:white_label_business_app/helpers/validation_helper.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<UsernameChanged>(onUsernameChanged);
    on<PasswordChanged>(onPasswordChanged);
    on<LoginSubmitted>(onLoginButtonClicked);
  }

  void onUsernameChanged(UsernameChanged event, Emitter<LoginState> emit) {
    var isValid = ValidationHelper.isUsernameValid(event.username);
      emit(state.copyWith(username: event.username,
          isUsernameValid:  isValid,
          errorUsernameText: (isValid || state.username.isEmpty)
              ? null : MConstants.validationEnterValidUsername,
          isFailure: false));
  }

  void onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    bool isValid = event.password.length >= 6;
    emit(state.copyWith(password: event.password, isPasswordValid: isValid,
        errorPasswordText: (isValid || state.password.isEmpty)
            ? null : MConstants.validationEnterValidPassword,
        isFailure: false));
  }

  FutureOr<void> onLoginButtonClicked(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (!state.isUsernameValid || !state.isPasswordValid) return;

    emit(state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false));

    await Future.delayed(const Duration(seconds: 2)); // Simulate API call

    if (state.username == "admin" && state.password == "password123") {
      emit(state.copyWith(isSuccess: true, isSubmitting: false));
    } else {
      emit(state.copyWith(isFailure: true, isSubmitting: false));
    }
  }
}
