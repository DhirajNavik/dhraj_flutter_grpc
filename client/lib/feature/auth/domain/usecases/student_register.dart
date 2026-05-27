import 'package:client/core/errors/failures.dart';
import 'package:client/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../params/register_params.dart';
import '../repositories/auth_repository.dart';

class StudentRegisterUseCase implements UseCase<String, StudentRegisterParams> {
  final AuthRepository authRepository;

  const StudentRegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(StudentRegisterParams params) {
    return authRepository.registerStudents(params);
  }
}
