import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginFormState {
  final FocusNode emailFocus;
  final FocusNode passwordFocus;
  final bool isPasswordObscured;
    final  GlobalKey<FormBuilderState> formKey ;

  LoginFormState({
    required this.emailFocus,
    required this.passwordFocus,
    required this.isPasswordObscured,
    required this.formKey,
  });

  LoginFormState copyWith({
    bool? isPasswordObscured,
  }) {
    return LoginFormState(
      emailFocus: emailFocus ,
      passwordFocus: passwordFocus,
      isPasswordObscured:
          isPasswordObscured ?? this.isPasswordObscured,
      formKey: formKey
    );
  }
}