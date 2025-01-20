import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/l10n/l10n.dart';
import 'package:swiftify/theme/theme.dart';
import 'package:swiftify/widgets/bottom_sheet_base.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BottomSheetBase(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardItem(
              title: l10n.system,
              iconData: Icons.brightness_auto,
              onTap: () => context
                  .read<ThemeBloc>()
                  .add(const ThemeModeChanged(ThemeMode.system)),
            ),
            CardItem(
              title: l10n.light,
              iconData: Icons.sunny,
              onTap: () => context
                  .read<ThemeBloc>()
                  .add(const ThemeModeChanged(ThemeMode.light)),
            ),
            CardItem(
              title: l10n.dark,
              iconData: Icons.nightlight_round,
              onTap: () => context
                  .read<ThemeBloc>()
                  .add(const ThemeModeChanged(ThemeMode.dark)),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  @visibleForTesting
  const CardItem({
    required this.title,
    required this.iconData,
    required this.onTap,
    super.key,
  });

  final String title;
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card.outlined(
        child: SizedBox.square(
          dimension: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
