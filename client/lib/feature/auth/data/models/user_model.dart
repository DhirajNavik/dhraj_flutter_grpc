import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protos/protos.dart';
import '../../domain/entities/user_entities.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    @Default(false) bool isActive,
  }) = _UserModel;

  factory UserModel.fromProto(User proto) {
    return UserModel(id: proto.id, name: proto.name, isActive: proto.isActive);
  }
}
