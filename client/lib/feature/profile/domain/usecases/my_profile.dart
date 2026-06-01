import 'package:fpdart/fpdart.dart';
import 'package:client/core/errors/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:client/feature/profile/domain/entities/user_model_entitiy.dart';
import 'package:client/feature/profile/domain/repositories/profile_repository.dart';

class MyProfileUseCase implements UseCase<UserModelEntity, NoParams> {
  final ProfileRepository repository;
  const MyProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserModelEntity>> call(NoParams params) {
    return repository.fetchMyProfile();
  }
}
