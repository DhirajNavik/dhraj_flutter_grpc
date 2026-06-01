import 'dart:developer';

import 'package:client/core/errors/exception.dart';
import 'package:client/feature/profile/data/models/user_model.dart';
import 'package:client/feature/profile/domain/datasources/profile_datasource.dart';
import 'package:protos/protos.dart';

class ProfileDataSourceGrpc implements ProfileDataSource {
  final ProfileServiceClient _stub;

  ProfileDataSourceGrpc(this._stub);

  @override
  Future<UserModel> myProfile() async {
    try {
      log("message", name: "--------------------------->");
      final result = await _stub.fetchMyProfile(Empty());
      return UserModel.fromProto(result.user);
    } on GrpcError catch (e) {
      log(e.message.toString(), name: "--------------------------->");

      throw ServerException(e.message ?? "Something went wrong");
    } catch (err, stackTrace) {
      log(err.toString(), name: "--------------------------->");
      throw ServerException("Something went wrong");
    }
  }
}
