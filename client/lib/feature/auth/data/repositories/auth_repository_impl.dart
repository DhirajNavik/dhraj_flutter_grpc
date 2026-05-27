import 'package:client/core/errors/exception.dart';
import 'package:client/core/errors/failures.dart';
import 'package:client/feature/auth/domain/params/login_params.dart';
import 'package:client/feature/auth/domain/entities/user_entities.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/datasources/auth_datasource.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  const AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserEntity>> login(LoginParams params) async {
    try {
      final result = await dataSource.login(params);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
