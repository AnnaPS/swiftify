import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/app/app_router/routes/album_route.dart';
import 'package:swiftify/app/app_router/routes/favorites_route.dart';
import 'package:swiftify/app/app_router/scaffold_with_bottom_navigation.dart';

final albumNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'albums');
final favoritesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favorites');

final dashBoardRoutes = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) => ScaffoldWithBottomNavigation(
    navigationShell: navigationShell,
  ),
  branches: [
    StatefulShellBranch(
      navigatorKey: albumNavigatorKey,
      routes: [albumRoutes],
    ),
    StatefulShellBranch(
      navigatorKey: favoritesNavigatorKey,
      routes: [favoriteRoutes],
    ),
  ],
);
