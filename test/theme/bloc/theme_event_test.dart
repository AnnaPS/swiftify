// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/theme/theme.dart';

void main() {
  group('ThemeEvent', () {
    test('supports value comparisons', () {
      expect(
        ThemeModeChanged(ThemeMode.system),
        equals(ThemeModeChanged(ThemeMode.system)),
      );

      expect(
        ThemeModeChanged(ThemeMode.light),
        equals(ThemeModeChanged(ThemeMode.light)),
      );

      expect(
        ThemeModeChanged(ThemeMode.dark),
        equals(ThemeModeChanged(ThemeMode.dark)),
      );

      expect(
        ThemeModeChanged(ThemeMode.system),
        isNot(equals(ThemeModeChanged(ThemeMode.light))),
      );
    });
  });
}
