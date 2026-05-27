import 'package:client/feature/auth/domain/params/register_params.dart';
import 'package:protos/protos.dart';

import '../../domain/datasources/auth_datasource.dart';
import '../models/user_model.dart';
import '../../domain/params/login_params.dart';

class AuthDatasourceGrpc implements AuthDataSource {
  final AuthServiceClient _stub;

  AuthDatasourceGrpc(this._stub);

  @override
  Future<UserModel> login(LoginParams model) async {
    final result = await _stub.login(model.toProto());
    return UserModel.fromProto(result.user);
  }

  @override
  Future<String> registerStudents(StudentRegisterParams model) async {
    final result = await _stub.registerStudent(model.toProto());
    return result.message;
  }
}
