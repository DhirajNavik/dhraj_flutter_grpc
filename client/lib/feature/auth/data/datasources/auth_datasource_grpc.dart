import 'package:client/core/errors/exception.dart';
import 'package:client/feature/auth/data/models/login_model.dart';
import 'package:client/feature/auth/domain/params/register_params.dart';
import 'package:protos/protos.dart';
import '../../domain/datasources/auth_datasource.dart';
import '../../domain/params/login_params.dart';

class AuthDatasourceGrpc implements AuthDataSource {
  final AuthServiceClient _stub;

  AuthDatasourceGrpc(this._stub);

  @override
  Future<LoginModel> login(LoginParams model) async {
    try {
      final result = await _stub.login(model.toProto());
      return LoginModel.fromProto(result);
    } on GrpcError catch (e) {
      throw ServerException(e.message ?? "Something went wrong");
    }
  }

  @override
  Future<String> registerStudents(StudentRegisterParams model) async {
    final result = await _stub.registerStudent(model.toProto());
    return result.message;
  }
}
