

import 'package:client/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/user_model_entitiy.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, UserModelEntity>> fetchMyProfile();
}