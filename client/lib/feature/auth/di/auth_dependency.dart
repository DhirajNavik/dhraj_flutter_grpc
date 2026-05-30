import 'package:client/feature/auth/data/datasources/auth_datasource_grpc.dart';
import 'package:client/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:client/feature/auth/domain/datasources/auth_datasource.dart';
import 'package:client/feature/auth/domain/repositories/auth_repository.dart';
import 'package:client/feature/auth/domain/usecases/student_register.dart';
import 'package:client/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:protos/protos.dart';

import '../../../config/injector/injector_config.dart';
import '../domain/usecases/user_login.dart';
import '../presentation/cubit/login_cubit/login_form_cubit.dart';

class AuthDependency {
  const AuthDependency._();
  static void init() {

    serviceLocater.registerFactory<LoginFormCubit>(
      () => LoginFormCubit(),
    );
    serviceLocater.registerFactory<AuthBloc>(
      () => AuthBloc(
        serviceLocater<UserLoginUseCase>(),
        serviceLocater<StudentRegisterUseCase>(),
      ),
    );
    serviceLocater.registerLazySingleton<UserLoginUseCase>(
      () => UserLoginUseCase(serviceLocater<AuthRepository>()),
    );
    serviceLocater.registerLazySingleton<StudentRegisterUseCase>(
      () => StudentRegisterUseCase(serviceLocater<AuthRepository>()),
    );

    serviceLocater.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocater<AuthDataSource>()),
    );

    serviceLocater.registerLazySingleton<AuthDataSource>(
      () => AuthDatasourceGrpc(serviceLocater<AuthServiceClient>()),
    );
  }
}
