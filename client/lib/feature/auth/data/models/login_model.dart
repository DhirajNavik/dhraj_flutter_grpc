import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protos/protos.dart';
import '../../domain/entities/login_entities.dart';
part 'login_model.freezed.dart';

@freezed
abstract class LoginModel with _$LoginModel implements LoginEntity {
  const LoginModel._();

  const factory LoginModel({
    required String token,
    @Default(UserRole.UNKNOWN) UserRole role,
  }) = _LoginModel;

  factory LoginModel.fromProto(LoginResponse proto) {
    return LoginModel(token: proto.token, role: proto.role);
  }
}
