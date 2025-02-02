// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRoute,
      $themePageRoute,
      $albumPageRoute,
    ];

RouteBase get $appShellRoute => ShellRouteData.$route(
      navigatorKey: AppShellRoute.$navigatorKey,
      factory: $AppShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $AlbumPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/favorites',
          name: 'favorites',
          factory: $FavoritesPageRouteExtension._fromState,
        ),
      ],
    );

extension $AppShellRouteExtension on AppShellRoute {
  static AppShellRoute _fromState(GoRouterState state) => const AppShellRoute();
}

extension $AlbumPageRouteExtension on AlbumPageRoute {
  static AlbumPageRoute _fromState(GoRouterState state) =>
      const AlbumPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FavoritesPageRouteExtension on FavoritesPageRoute {
  static FavoritesPageRoute _fromState(GoRouterState state) =>
      const FavoritesPageRoute();

  String get location => GoRouteData.$location(
        '/favorites',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $themePageRoute => GoRouteData.$route(
      path: '/theme',
      name: 'theme',
      factory: $ThemePageRouteExtension._fromState,
    );

extension $ThemePageRouteExtension on ThemePageRoute {
  static ThemePageRoute _fromState(GoRouterState state) =>
      const ThemePageRoute();

  String get location => GoRouteData.$location(
        '/theme',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $albumPageRoute => GoRouteData.$route(
      path: '/',
      factory: $AlbumPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'songs/:albumId',
          name: 'songs',
          factory: $SongsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/song-detail/:songId',
          name: 'song-detail',
          factory: $SongDetailPageRouteExtension._fromState,
        ),
      ],
    );

extension $SongsPageRouteExtension on SongsPageRoute {
  static SongsPageRoute _fromState(GoRouterState state) => SongsPageRoute(
        albumId: int.parse(state.pathParameters['albumId']!),
        albumTitle: state.uri.queryParameters['album-title'],
        coverAlbum: state.uri.queryParameters['cover-album'],
        albumReleaseDate: state.uri.queryParameters['album-release-date'],
      );

  String get location => GoRouteData.$location(
        '/songs/${Uri.encodeComponent(albumId.toString())}',
        queryParams: {
          if (albumTitle != null) 'album-title': albumTitle,
          if (coverAlbum != null) 'cover-album': coverAlbum,
          if (albumReleaseDate != null) 'album-release-date': albumReleaseDate,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SongDetailPageRouteExtension on SongDetailPageRoute {
  static SongDetailPageRoute _fromState(GoRouterState state) =>
      SongDetailPageRoute(
        songId: int.parse(state.pathParameters['songId']!),
        songTitle: state.uri.queryParameters['song-title'],
        lyrics: state.uri.queryParameters['lyrics'],
        coverAlbum: state.uri.queryParameters['cover-album'],
      );

  String get location => GoRouteData.$location(
        '/song-detail/${Uri.encodeComponent(songId.toString())}',
        queryParams: {
          if (songTitle != null) 'song-title': songTitle,
          if (lyrics != null) 'lyrics': lyrics,
          if (coverAlbum != null) 'cover-album': coverAlbum,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
