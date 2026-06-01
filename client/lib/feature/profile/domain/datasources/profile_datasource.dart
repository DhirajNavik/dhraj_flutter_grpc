
import '../../data/models/user_model.dart';

abstract interface class ProfileDataSource {
  Future<UserModel> myProfile();
}