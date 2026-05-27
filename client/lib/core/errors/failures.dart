import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure([
    this.message = "An unexpected error occurred.",
  ]);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([
    super.message,
  ]);
}

class CacheFailure extends Failure {
  const CacheFailure([
    super.message = "Cache error occurred.",
  ]);
}

class EmptyFailure extends Failure {
  const EmptyFailure([
    super.message = "No data found.",
  ]);
}

class CredentialFailure extends Failure {
  const CredentialFailure([
    super.message = "Invalid credentials.",
  ]);
}

class DuplicateEmailFailure extends Failure {
  const DuplicateEmailFailure([
    super.message = "Email already exists.",
  ]);
}

class PasswordNotMatchFailure extends Failure {
  const PasswordNotMatchFailure([
    super.message = "Passwords do not match.",
  ]);
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure([
    super.message = "Invalid email.",
  ]);
}

class InvalidPasswordFailure extends Failure {
  const InvalidPasswordFailure([
    super.message = "Invalid password.",
  ]);
}