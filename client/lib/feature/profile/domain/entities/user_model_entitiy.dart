import 'package:protos/protos.dart';

class UserModelEntity {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final UserRole role;

  const UserModelEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
    required this.username,
    required this.role,
  });
}
