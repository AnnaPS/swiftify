import 'package:swiftify/app/app_router/app_route.dart';
import 'package:swiftify/favorites/favorites.dart';

final favoriteRoutes = AppRoute(
  name: FavoritesPage.routeName,
  path: FavoritesPage.routeName,
  builder: (context, state) => const FavoritesPage(),
);
