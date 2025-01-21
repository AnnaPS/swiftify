import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/app/app_router/router.dart';
import 'package:swiftify/l10n/l10n.dart';

class ScaffoldWithBottomNavigation extends StatelessWidget {
  const ScaffoldWithBottomNavigation({
    required this.child,
    super.key,
  });

  final Widget child;

  int getCurrentIndex(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    if (path == AlbumPageRoute.path) {
      return 0;
    } else {
      return 1;
    }
  }

  void _onTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        const AlbumPageRoute().go(context);
      case 1:
        const FavoritesPageRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final currentIndex = getCurrentIndex(context);

    return Scaffold(
      appBar: AppBar(
        title: currentIndex == 0
            ? Text(l10n.albumsTitle)
            : Text(l10n.favoritesTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline),
            onPressed: () => const ThemePageRoute().push<void>(context),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTap(index, context),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.album_outlined),
            label: l10n.albumsTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_outline_outlined),
            label: l10n.favoritesTitle,
          ),
        ],
      ),
    );
  }
}
