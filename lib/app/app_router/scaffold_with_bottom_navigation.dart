import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/l10n/l10n.dart';
import 'package:swiftify/theme/view/theme_bottom_sheet.dart';

class ScaffoldWithBottomNavigation extends StatelessWidget {
  const ScaffoldWithBottomNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      appBar: AppBar(
        title: currentIndex == 0
            ? Text(l10n.albumsTitle)
            : Text(l10n.favoritesTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline),
            onPressed: () => context.push(ThemeBottomSheet.routeName),
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
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
