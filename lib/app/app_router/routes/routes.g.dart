// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRoute,
    ];

RouteBase get $appShellRoute => ShellRouteData.$route(
      navigatorKey: AppShellRoute.$navigatorKey,
      factory: $AppShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $AlbumPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'songs/:id',
              parentNavigatorKey: SongPageRoute.$parentNavigatorKey,
              factory: $SongPageRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/favorites',
          factory: $FavoritesPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/theme',
          factory: $ThemePageRouteExtension._fromState,
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

extension $SongPageRouteExtension on SongPageRoute {
  static SongPageRoute _fromState(GoRouterState state) => SongPageRoute(
        id: int.parse(state.pathParameters['id']!),
        albumTitle: state.uri.queryParameters['album-title'],
        coverAlbum: state.uri.queryParameters['cover-album'],
        albumReleaseDate: state.uri.queryParameters['album-release-date'],
      );

  String get location => GoRouteData.$location(
        '/songs/${Uri.encodeComponent(id.toString())}',
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
