import '../../data/models/login_model.dart';

import '../params/login_params.dart';
import '../params/register_params.dart';

abstract interface class AuthDataSource {
  Future<LoginModel> login(LoginParams  model);
  Future<String> registerStudents(StudentRegisterParams  model);
}