// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    late AppTheme appTheme;

    setUp(() {
      appTheme = AppTheme();
    });

    group('light', () {
      test('colorScheme primary is correct', () {
        expect(
          appTheme.light.colorScheme.primary,
          equals(Color(0xff1a6b51)),
        );
      });
    });

    group('lightHighContrast', () {
      test('colorScheme primary is correct', () {
        expect(
          appTheme.lightHighContrast.colorScheme.primary,
          equals(
            Color(0xff00281c),
          ),
        );
      });
    });

    group('dark', () {
      test('colorScheme primary is correct', () {
        expect(
          appTheme.dark.colorScheme.primary,
          equals(Color(0xff8ad6b7)),
        );
      });
    });

    group('darkHighContrast', () {
      test('colorScheme primary is correct', () {
        expect(
          AppTheme().darkHighContrast.colorScheme.primary,
          equals(Color(0xffedfff4)),
        );
      });
    });
  });
}
