// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/theme/theme.dart';

import '../../helpers/helpers.dart';
import '../../helpers/l10n.dart';

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeMode>
    implements ThemeBloc {}

void main() {
  group('ThemeBottomSheet', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = _MockThemeBloc();
      when(() => themeBloc.state).thenReturn(ThemeMode.light);
    });

    setUpAll(mockHydratedStorage);

    testWidgets('can be rendered', (tester) async {
      await tester.pumpApp(
        ThemeBottomSheet(),
        themeModeBloc: themeBloc,
      );
      expect(find.byType(ThemeBottomSheet), findsOneWidget);
    });

    testWidgets('sets dark as a theme mode', (tester) async {
      await tester.pumpApp(
        const ThemeBottomSheet(),
        themeModeBloc: themeBloc,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(tester.l10n.dark));
      await tester.pumpAndSettle();
      verify(
        () => themeBloc.add(const ThemeModeChanged(ThemeMode.dark)),
      ).called(1);
    });

    testWidgets('sets light as a theme mode', (tester) async {
      await tester.pumpApp(
        const ThemeBottomSheet(),
        themeModeBloc: themeBloc,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(tester.l10n.light));
      await tester.pumpAndSettle();
      verify(
        () => themeBloc.add(const ThemeModeChanged(ThemeMode.light)),
      ).called(1);
    });

    testWidgets('sets system as a theme mode', (tester) async {
      await tester.pumpApp(
        const ThemeBottomSheet(),
        themeModeBloc: themeBloc,
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(tester.l10n.system));
      await tester.pumpAndSettle();
      verify(
        () => themeBloc.add(const ThemeModeChanged(ThemeMode.system)),
      ).called(1);
    });
  });
}
