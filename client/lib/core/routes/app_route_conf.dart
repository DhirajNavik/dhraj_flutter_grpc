import 'package:client/config/secure/secure_storage.dart';
import 'package:client/core/routes/app_route_path.dart';
import 'package:client/feature/auth/presentation/pages/login_view.dart';
import 'package:client/feature/home/presentation/screens/home_view.dart';
import 'package:client/feature/others/presentation/pages/error_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouteConf {
  AppRouteConf._();
  static GoRouter get router => _router;
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoute.auth.path,
    refreshListenable: GoRouterRefreshStream(SessionController.instance.stream),
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
    errorPageBuilder: (_, _) => MaterialPage(child: ErrorView()),
    redirect: (context, state) {
      final hasToken = SessionController.instance.token != null;

      if (!hasToken) {
        return AppRoute.auth.path;
      }

      return null;
    },
  );
}
