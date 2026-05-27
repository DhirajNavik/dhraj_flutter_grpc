import 'package:protos/protos.dart' as proto;

class LoginParams  {
  final String identifier;
  final String password;

  const LoginParams ({required this.identifier, required this.password});

  proto.LoginRequest toProto() {
    return proto.LoginRequest(identifier: identifier, password: password);
  }
}
