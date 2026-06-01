import 'package:client/core/network/auth_interceptor.dart';
import 'package:client/feature/profile/di/profile_dependency.dart';
import 'package:go_router/go_router.dart';

import 'injector.dart';
import 'package:get_it/get_it.dart';
import 'package:protos/protos.dart';

final serviceLocater = GetIt.instance;

void initDependencies() {
  serviceLocater.registerLazySingleton<ClientChannel>(() => GrpcClient.channel);

  serviceLocater.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(),
  );

  serviceLocater.registerLazySingleton<AuthServiceClient>(
    () => AuthServiceClient(serviceLocater<ClientChannel>()),
  );

  serviceLocater.registerLazySingleton<ProfileServiceClient>(
    () => ProfileServiceClient(
      serviceLocater<ClientChannel>(),
      interceptors: [serviceLocater<AuthInterceptor>()],
    ),
  );

  serviceLocater.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  serviceLocater.registerSingleton<GoRouter>(AppRouteConf.router);

  AuthDependency.init();
  ProfileDependency.init();
}
