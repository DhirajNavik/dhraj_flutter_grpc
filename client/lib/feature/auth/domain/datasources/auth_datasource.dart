import '../params/login_params.dart';
import '../../data/models/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel> login(LoginParams  model);
}