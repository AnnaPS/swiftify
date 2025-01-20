// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardShellRoute,
    ];

RouteBase get $dashboardShellRoute => ShellRouteData.$route(
      factory: $DashboardShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/albums',
          factory: $AlbumPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'songs',
              name: 'songs',
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

extension $DashboardShellRouteExtension on DashboardShellRoute {
  static DashboardShellRoute _fromState(GoRouterState state) =>
      const DashboardShellRoute();
}

extension $AlbumPageRouteExtension on AlbumPageRoute {
  static AlbumPageRoute _fromState(GoRouterState state) =>
      const AlbumPageRoute();

  String get location => GoRouteData.$location(
        '/albums',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SongPageRouteExtension on SongPageRoute {
  static SongPageRoute _fromState(GoRouterState state) => SongPageRoute(
        albumId: int.parse(state.uri.queryParameters['album-id']!),
        albumTitle: state.uri.queryParameters['album-title'],
        coverAlbum: state.uri.queryParameters['cover-album'],
        albumReleaseDate: state.uri.queryParameters['album-release-date'],
      );

  String get location => GoRouteData.$location(
        '/albums/songs',
        queryParams: {
          'album-id': albumId.toString(),
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
