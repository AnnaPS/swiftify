import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/app_route.dart';

final albumRoutes = AppRoute(
  name: AlbumPage.routeName,
  path: AlbumPage.routeName,
  builder: (context, state) => const AlbumPage(),
  //routes: [

  //],
);
