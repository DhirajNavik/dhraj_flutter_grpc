import 'package:protos/protos.dart';

UserRole getUserFromString(String? value) {
  return UserRole.values.firstWhere(
    (e) => e.name == value?.toLowerCase(),
    orElse: () => UserRole.UNKNOWN,
  );
}

enum ActionType { fullAccess, viewAccess, noAccess, createAccess, deleteAccess }
