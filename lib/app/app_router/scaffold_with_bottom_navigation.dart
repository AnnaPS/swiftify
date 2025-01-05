import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/l10n/l10n.dart';

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

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.album_outlined),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
