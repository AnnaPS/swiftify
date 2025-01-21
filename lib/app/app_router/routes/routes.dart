import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/router.dart';
import 'package:swiftify/favorites/favorites.dart';
import 'package:swiftify/song/song.dart';
import 'package:swiftify/theme/theme.dart';

part 'routes.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<AppShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AlbumPageRoute>(
      path: AlbumPageRoute.path,
      routes: [
        TypedGoRoute<SongPageRoute>(
          path: SongPageRoute.path,
        ),
      ],
    ),
    TypedGoRoute<FavoritesPageRoute>(
      path: FavoritesPageRoute.path,
    ),
    TypedGoRoute<ThemePageRoute>(
      path: ThemePageRoute.path,
    ),
  ],
)
class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  /// The navigator key for the shell navigator.
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return CustomTransitionPage(
      child: ScaffoldWithBottomNavigation(child: navigator),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

@immutable
class ThemePageRoute extends GoRouteData {
  const ThemePageRoute();

  static const path = '/theme';

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

  static const path = '/favorites';

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
  static const path = '/';

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
    required this.id,
    this.albumTitle,
    this.coverAlbum,
    this.albumReleaseDate,
  });

  /// The id of the album to show
  /// This is passed in the path as a parameter
  final int id;

  /// The title of the album
  /// This is passed in as a query parameter.
  /// It is optional and can be null.
  final String? albumTitle;

  /// The cover of the album
  /// This is passed in as a query parameter.
  /// It is optional and can be null.
  final String? coverAlbum;

  /// The release date of the album
  /// This is passed in as a query parameter.
  /// It is optional and can be null.
  final String? albumReleaseDate;

  static const path = 'songs/:id';

  /// The parent navigator key.
  /// This is used to push the page on the parent navigator
  /// when the page is a nested route
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: SongPage(
        albumId: id,
        albumTitle: albumTitle,
        coverAlbum: coverAlbum,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
