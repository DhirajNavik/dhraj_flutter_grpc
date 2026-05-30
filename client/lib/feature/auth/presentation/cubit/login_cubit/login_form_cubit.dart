import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'login_form_state.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit()
    : super(
        LoginFormState(
          emailFocus: FocusNode(),
          passwordFocus: FocusNode(),
          isPasswordObscured: true,
          formKey: GlobalKey<FormBuilderState>(),
        ),
      );

  /// Move focus from email → password
  void focusPassword() {
    state.emailFocus.unfocus();
    state.passwordFocus.requestFocus();
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  /// Keep password focused when eye icon tapped
  void requestPasswordFocus() {
    if (!state.passwordFocus.hasFocus) {
      state.passwordFocus.requestFocus();
    }
  }

  bool validateLogin() {
    return state.formKey.currentState?.saveAndValidate() ?? false;
  }

  Map<String, dynamic> get values => state.formKey.currentState!.value;

  /// Dispose focus nodes
  @override
  Future<void> close() {
    state.emailFocus.dispose();
    state.passwordFocus.dispose();
    return super.close();
  }

  void clear() {
     state.formKey.currentState?.reset();
    if (state.isPasswordObscured == false) {
      emit(state.copyWith(isPasswordObscured: true));
    }
  }
}
