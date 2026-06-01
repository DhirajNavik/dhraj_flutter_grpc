import 'package:client/config/injector/injector_config.dart';
import 'package:client/feature/profile/data/datasources/profile_datasource_grpc.dart';
import 'package:client/feature/profile/data/repositories/profile_repository_impl.dart';
import 'package:client/feature/profile/domain/datasources/profile_datasource.dart';
import 'package:client/feature/profile/domain/repositories/profile_repository.dart';
import 'package:client/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:protos/protos.dart';

import '../domain/usecases/my_profile.dart';

class ProfileDependency {
  const ProfileDependency._();
  static void init() {
    serviceLocater.registerFactory<ProfileBloc>(
      () => ProfileBloc(serviceLocater<MyProfileUseCase>()),
    );

    serviceLocater.registerLazySingleton<MyProfileUseCase>(
      () => MyProfileUseCase(serviceLocater<ProfileRepository>()),
    );

    serviceLocater.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(serviceLocater<ProfileDataSource>()),
    );
    serviceLocater.registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceGrpc(serviceLocater<ProfileServiceClient>()),
    );
  }
}
