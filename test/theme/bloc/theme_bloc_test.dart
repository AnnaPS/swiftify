import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/theme/theme.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ThemeModeBloc', () {
    setUpAll(mockHydratedStorage);

    test('initial state is ThemeMode.system', () {
      expect(ThemeBloc().state, ThemeMode.system);
    });

    blocTest<ThemeBloc, ThemeMode>(
      'on ThemeModeChanged sets the ThemeMode',
      build: ThemeBloc.new,
      act: (bloc) => bloc.add(const ThemeModeChanged(ThemeMode.dark)),
      expect: () => [ThemeMode.dark],
    );

    test('toJson and fromJson are inverse', () {
      for (final mode in ThemeMode.values) {
        final bloc = ThemeBloc();
        expect(bloc.fromJson(bloc.toJson(mode)), mode);
      }
    });
  });
}
