import 'package:client/core/errors/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../params/login_params.dart';
import '../entities/user_entities.dart';
import '../repositories/auth_repository.dart';

class UserLoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository authRepository;

  const UserLoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) {
    return authRepository.login(params);
  }

  
}
