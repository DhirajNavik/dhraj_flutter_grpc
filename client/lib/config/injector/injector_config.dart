

import 'package:go_router/go_router.dart';

import 'injector.dart';
import 'package:get_it/get_it.dart';
import 'package:protos/protos.dart';

final serviceLocater = GetIt.instance;

void initDependencies() {
  serviceLocater.registerLazySingleton<ClientChannel>(() => GrpcClient.channel);

  serviceLocater.registerLazySingleton<AuthServiceClient>(
    () => AuthServiceClient(serviceLocater<ClientChannel>()),
  );

  serviceLocater.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  serviceLocater.registerSingleton<GoRouter>(
  AppRouteConf.router,
);

  AuthDependency.init();
}
