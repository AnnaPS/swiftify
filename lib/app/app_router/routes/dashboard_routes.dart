import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/app/app_router/app_router.dart';
import 'package:swiftify/app/app_router/routes/albums_routes.dart';
import 'package:swiftify/app/app_router/scaffold_with_bottom_navigation.dart';
import 'package:swiftify/favorites/favorites.dart';

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
      routes: [albumsRoutes],
    ),
    StatefulShellBranch(
      navigatorKey: favoritesNavigatorKey,
      routes: [
        AppRoute(
          name: FavoritesPage.routeName,
          path: FavoritesPage.routeName,
          builder: (context, state) => const FavoritesPage(),
        ),
      ],
    ),
  ],
);
