import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protos/protos.dart';
import '../../domain/entities/user_entities.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel  with _$UserModel  implements UserEntity{
   const UserModel._();

  const factory UserModel({
    required String id,
    required String name,
    @Default(false) bool isActive,
  }) = _UserModel;

  factory UserModel.fromProto(User proto) {
    return UserModel(id: proto.id, name: proto.name, isActive: proto.isActive);
  }

}

