import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/routes/dashboard_routes.dart';

export 'app_route.dart';
export 'go_router_observer.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter({
    String? initialLocation = AlbumPage.routeName,
    List<NavigatorObserver> navigatorObservers = const [],
    GoRouter? goRouter,
  }) {
    _goRouter = goRouter ??
        _routes(
          initialLocation,
          navigatorObservers,
        );
  }

  late final GoRouter _goRouter;

  GoRouter get routes => _goRouter;

  GoRouter _routes(
    String? initialLocation,
    List<NavigatorObserver> navigatorObservers,
  ) {
    return GoRouter(
      initialLocation: initialLocation,
      observers: navigatorObservers,
      debugLogDiagnostics: kDebugMode,
      navigatorKey: rootNavigatorKey,
      routes: [
        dashBoardRoutes,
      ],
    );
  }
}
