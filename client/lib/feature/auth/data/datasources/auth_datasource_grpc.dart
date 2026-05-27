import 'package:protos/protos.dart';

import '../../domain/datasources/auth_datasource.dart';
import '../models/user_model.dart';
import '../../domain/params/login_params.dart';

class AuthDatasourceGrpc implements AuthDataSource {
  final AuthServiceClient _stub;

  AuthDatasourceGrpc(this._stub);

  @override
  Future<UserModel> login(LoginParams  proto) async {
    final result = await _stub.login(proto.toProto());
    return UserModel.fromProto(result.user);
  }
}
