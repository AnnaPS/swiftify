import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/router.dart';
import 'package:swiftify/favorites/favorites.dart';
import 'package:swiftify/song_detail/song_detail.dart';
import 'package:swiftify/songs/songs.dart';
import 'package:swiftify/theme/theme.dart';

part 'routes.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<AppShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AlbumPageRoute>(
      path: AlbumPageRoute.path,
    ),
    TypedGoRoute<FavoritesPageRoute>(
      path: FavoritesPageRoute.path,
      name: FavoritesPageRoute.name,
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

@TypedGoRoute<ThemePageRoute>(
  path: ThemePageRoute.path,
  name: ThemePageRoute.name,
)
class ThemePageRoute extends GoRouteData {
  const ThemePageRoute();

  static const path = '/theme';
  static const name = 'theme';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ModalBottomSheet(
      builder: (_) => const ThemeBottomSheet(),
    );
  }
}

class FavoritesPageRoute extends GoRouteData {
  const FavoritesPageRoute();

  static const path = '/favorites';
  static const name = 'favorites';

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

@TypedGoRoute<AlbumPageRoute>(
  path: AlbumPageRoute.path,
  routes: [
    TypedGoRoute<SongsPageRoute>(
      path: SongsPageRoute.path,
      name: SongsPageRoute.name,
    ),
    TypedGoRoute<SongDetailPageRoute>(
      path: SongDetailPageRoute.path,
      name: SongDetailPageRoute.name,
    ),
  ],
)
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

class SongsPageRoute extends GoRouteData {
  const SongsPageRoute({
    required this.albumId,
    this.albumTitle,
    this.coverAlbum,
    this.albumReleaseDate,
  });

  /// The album id to display the songs for.
  /// This is passed in the path as a parameter
  final int albumId;

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

  static const path = 'songs/:albumId';
  static const name = 'songs';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: SongsPage(
        albumId: albumId,
        albumTitle: albumTitle,
        coverAlbum: coverAlbum,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

class SongDetailPageRoute extends GoRouteData {
  const SongDetailPageRoute({
    required this.songId,
    this.songTitle,
    this.lyrics,
    this.coverAlbum,
  });

  final int songId;
  final String? lyrics;
  final String? songTitle;
  final String? coverAlbum;

  static const path = '/song-detail/:songId';
  static const name = 'song-detail';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: SongDetailPage(
        songId: songId,
        songTitle: songTitle ?? '',
        lyrics: lyrics ?? '',
        coverAlbum: coverAlbum,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
