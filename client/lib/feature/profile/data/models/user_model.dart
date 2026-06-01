import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:client/feature/profile/domain/entities/user_model_entitiy.dart';
import 'package:protos/protos.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel implements UserModelEntity {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String name,
    required String username,
    required String email,
    required String phone,
    @Default(UserRole.UNKNOWN) UserRole role,
    @Default(false) bool active,
  }) = _UserModel;
  factory UserModel.fromProto(User proto) {
    return UserModel(
      id: proto.id,
      name: proto.name,
      username: proto.username,
      email: proto.email,
      phone: proto.phone,
      active: proto.isActive,
      role: proto.role,
    );
  }
}
