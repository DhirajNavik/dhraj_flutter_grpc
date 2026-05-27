import '../params/login_params.dart';
import '../../data/models/user_model.dart';
import '../params/register_params.dart';

abstract interface class AuthDataSource {
  Future<UserModel> login(LoginParams  model);
  Future<String> registerStudents(StudentRegisterParams  model);
}