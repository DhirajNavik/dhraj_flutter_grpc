import 'package:client/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import '../params/login_params.dart';
import '../entities/user_entities.dart';
import '../params/register_params.dart';

abstract interface  class AuthRepository {
  Future<Either<Failure, UserEntity>> login(LoginParams params);
  Future<Either<Failure, String>> registerStudents(StudentRegisterParams params);
}