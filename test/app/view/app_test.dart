import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/app/app.dart';
import 'package:swiftify/theme/theme.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

import '../../helpers/helpers.dart';

class _MockSwiftifyRepository extends Mock implements SwiftifyRepository {}

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeMode>
    implements ThemeBloc {}

void main() {
  group('App', () {
    late SwiftifyRepository swiftifyRepository;
    late ThemeBloc themeBloc;

    setUpAll(mockHydratedStorage);

    setUp(() {
      swiftifyRepository = _MockSwiftifyRepository();
      themeBloc = _MockThemeBloc();
      when(() => themeBloc.state).thenReturn(ThemeMode.system);
    });

    testWidgets('renders BottomNavigationBar', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: themeBloc,
          child: App(
            swiftifyRepository: swiftifyRepository,
          ),
        ),
      );
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });
}
