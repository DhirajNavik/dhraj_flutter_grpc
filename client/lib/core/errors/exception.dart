class ServerException implements Exception {
  final String message;

  const ServerException([
    this.message = "A problem occurred.",
  ]);

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  const CacheException([
    this.message = "Cache error occurred.",
  ]);

  @override
  String toString() => message;
}

class AuthException implements Exception {
  final String message;

  const AuthException([
    this.message = "Authentication failed.",
  ]);

  @override
  String toString() => message;
}

class EmptyException implements Exception {
  final String message;

  const EmptyException([
    this.message = "No data found.",
  ]);

  @override
  String toString() => message;
}

class DuplicateEmailException implements Exception {
  final String message;

  const DuplicateEmailException([
    this.message = "Email already exists.",
  ]);

  @override
  String toString() => message;
}