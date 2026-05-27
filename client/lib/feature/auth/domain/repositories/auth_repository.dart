import 'package:client/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import '../params/login_params.dart';
import '../entities/user_entities.dart';

abstract interface  class AuthRepository {
  Future<Either<Failure, UserEntity>> login(LoginParams params);
}