import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/modal_pop_up_page.dart';
import 'package:swiftify/app/app_router/scaffold_with_bottom_navigation.dart';
import 'package:swiftify/favorites/favorites.dart';
import 'package:swiftify/song/song.dart';
import 'package:swiftify/theme/theme.dart';

part 'dashboard_routes.g.dart';

final albumNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'albums');
final favoritesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favorites');
final themeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'theme');

ModalRoute<void> themeModalRoute() {
  return MaterialPageRoute<void>(
    builder: (context) => const ThemeBottomSheet(),
    settings: const RouteSettings(name: ThemePageRoute.routeName),
  );
}

@TypedShellRoute<DashboardShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AlbumPageRoute>(
      path: AlbumPageRoute.routeName,
      routes: [
        TypedGoRoute<SongPageRoute>(
          name: SongPageRoute.routeName,
          path: SongPageRoute.routeName,
        ),
      ],
    ),
    TypedGoRoute<FavoritesPageRoute>(
      path: FavoritesPageRoute.routeName,
    ),
    TypedGoRoute<ThemePageRoute>(
      path: ThemePageRoute.routeName,
    ),
  ],
)
class DashboardShellRoute extends ShellRouteData {
  const DashboardShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return ScaffoldWithBottomNavigation(
      child: navigator,
    );
  }
}

@immutable
class ThemePageRoute extends GoRouteData {
  const ThemePageRoute();

  static const routeName = '/theme';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ModalPopupPage(
      builder: (context) => const ThemeBottomSheet(),
    );
  }
}

@immutable
class FavoritesPageRoute extends GoRouteData {
  const FavoritesPageRoute();

  static const routeName = '/favorites';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const FavoritesPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

@immutable
class AlbumPageRoute extends GoRouteData {
  const AlbumPageRoute();
  static const routeName = '/albums';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const AlbumPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

@immutable
class SongPageRoute extends GoRouteData {
  const SongPageRoute({
    required this.albumId,
    this.albumTitle,
    this.coverAlbum,
    this.albumReleaseDate,
  });

  final int albumId;
  final String? albumTitle;
  final String? coverAlbum;
  final String? albumReleaseDate;

  static const routeName = 'songs';

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return SongPage(
      albumId: albumId,
      albumTitle: albumTitle,
      coverAlbum: coverAlbum,
      albumReleaseDate: albumReleaseDate,
    );
  }
}
