import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client/feature/auth/domain/params/login_params.dart';
import 'package:client/feature/auth/domain/params/register_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entities.dart';
import '../../domain/usecases/student_register.dart';
import '../../domain/usecases/user_login.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUseCase _loginUseCase;
  final StudentRegisterUseCase _studentRegisterUseCase;
  AuthBloc(this._loginUseCase, this._studentRegisterUseCase)
    : super(const AuthState.initial()) {
    on<AuthLoginSubmitted>(_onAuthLoginSubmitted);
    on<AuthRegisterStudent>(_onAuthRegisterStudent);
  }

  FutureOr<void> _onAuthLoginSubmitted(
    AuthLoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _loginUseCase(event.params);

    log(result.toString(),name: "---------->");

    result.match(
      (failure) {
        log("Im Here");
        emit(AuthState.error(failure.message));
      },
      (user) {
        emit(AuthState.authenticated(user));
      },
    );
  }

  FutureOr<void> _onAuthRegisterStudent(
    AuthRegisterStudent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _studentRegisterUseCase(event.params);

    result.match(
      (failure) {
        emit(AuthState.error(failure.message));
      },
      (message) {
        emit(AuthState.registerStudent(message));
      },
    );
  }
}
