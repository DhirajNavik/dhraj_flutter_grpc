part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent{
  const factory AuthEvent.loginSubmitted(
    LoginParams params
  ) = AuthLoginSubmitted ;
   const factory AuthEvent.registerStudent(
    StudentRegisterParams params
  ) = AuthRegisterStudent;
}
