part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(LoginEntity user) = _Authenticated;
  const factory AuthState.registerStudent(String user) = _Messgae;

  const factory AuthState.error(String message) = _Error;
}
