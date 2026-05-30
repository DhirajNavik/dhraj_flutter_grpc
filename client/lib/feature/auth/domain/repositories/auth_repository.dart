import 'package:client/core/errors/failures.dart';
import '../entities/login_entities.dart';
import 'package:fpdart/fpdart.dart';
import '../params/login_params.dart';
import '../params/register_params.dart';

abstract interface  class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParams params);
  Future<Either<Failure, String>> registerStudents(StudentRegisterParams params);
}