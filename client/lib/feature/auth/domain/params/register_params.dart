import 'package:protos/protos.dart' as proto;

class StudentRegisterParams {
  final String name;
  final String email;
  final String password;
  final String phone;

  const StudentRegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  proto.RegisterRequest toProto() {
    return proto.RegisterRequest(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );
  }
}
