import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/app/app_router/routes/routes.dart';

export 'go_router_observer.dart';

class AppRouter {
  AppRouter({
    List<NavigatorObserver> navigatorObservers = const [],
    GoRouter? goRouter,
  }) {
    _goRouter = goRouter ??
        _routes(
          navigatorObservers,
        );
  }

  late final GoRouter _goRouter;
  GoRouter get routes => _goRouter;

  GoRouter _routes(
    List<NavigatorObserver> navigatorObservers,
  ) {
    return GoRouter(
      initialLocation: const AlbumPageRoute().location,
      observers: navigatorObservers,
      debugLogDiagnostics: kDebugMode,
      navigatorKey: rootNavigatorKey,
      routes: $appRoutes,
    );
  }
}
