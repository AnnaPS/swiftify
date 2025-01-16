import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/app_router.dart';
import 'package:swiftify/song/song.dart';

final albumsRoutes = AppRoute(
  name: AlbumPage.routeName,
  path: AlbumPage.routeName,
  builder: (context, state) => const AlbumPage(),
  routes: [
    AppRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: '${AlbumPage.routeName}/${SongPage.routeName}',
      path: SongPage.routeName,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        child: SongPage.pageBuilder(context, state),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            )
                .chain(
                  CurveTween(curve: Curves.easeInOut),
                )
                .animate(animation),
            child: child,
          );
        },
      ),
    ),
  ],
);
