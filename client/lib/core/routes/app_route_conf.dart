import 'package:client/core/routes/app_route_path.dart';
import 'package:client/feature/auth/presentation/pages/login_view.dart';
import 'package:client/feature/home/presentation/screens/home_view.dart';
import 'package:client/feature/others/presentation/pages/error_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouteConf {
  AppRouteConf._();
  static GoRouter get router => _router;
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoute.auth.path,
    routes: [
      GoRoute(
        path: AppRoute.auth.path,
        name: AppRoute.auth.pathName,
        pageBuilder: (_, _) => MaterialPage(child: LoginView()),
      ),
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.pathName,
        pageBuilder: (_, _) => MaterialPage(child: HomeView()),
      ),
    ],
    redirect: (context, state) {
      return null;
    },
    errorPageBuilder: (_, _) => MaterialPage(child: ErrorView()),
  );
}
