import 'package:client/core/errors/exception.dart';
import 'package:client/core/errors/failures.dart';
import 'package:client/feature/profile/domain/datasources/profile_datasource.dart';
import 'package:client/feature/profile/domain/entities/user_model_entitiy.dart';
import 'package:client/feature/profile/domain/repositories/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  const ProfileRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, UserModelEntity>> fetchMyProfile() async{
   try {
      final result = await dataSource.myProfile();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
