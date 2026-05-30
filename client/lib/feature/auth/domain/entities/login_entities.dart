import 'package:protos/protos.dart';

abstract class LoginEntity {
  final String token;
  final UserRole role;

  const LoginEntity({
    required this.token,
    required this.role,
  });
}