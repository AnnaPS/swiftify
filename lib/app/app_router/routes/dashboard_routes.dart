import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/app_router.dart';
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
      routes: [
        AppRoute(
          name: AlbumPage.routeName,
          path: AlbumPage.routeName,
          builder: (context, state) => const AlbumPage(),
        ),
      ],
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
