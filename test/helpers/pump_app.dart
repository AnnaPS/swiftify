import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:swiftify/app/app_router/app_router.dart';
import 'package:swiftify/l10n/l10n.dart';
import 'package:swiftify/theme/theme.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class MockAppRouter extends Mock implements AppRouter {}

class _MockSwiftifyRepository extends Mock implements SwiftifyRepository {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeMode>
    implements ThemeBloc {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    SwiftifyRepository? swiftifyRepository,
    GoRouter? goRouter,
    ThemeBloc? themeModeBloc,
  }) async {
    await pumpWidget(
      RepositoryProvider.value(
        value: swiftifyRepository ?? _MockSwiftifyRepository(),
        child: BlocProvider.value(
          value: themeModeBloc ?? _MockThemeBloc(),
          child: InheritedGoRouter(
            goRouter: goRouter ?? _MockGoRouter(),
            child: MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: const AppTheme().light,
              home: Scaffold(body: widget),
            ),
          ),
        ),
      ),
    );
    await pump();
  }

  Future<void> pumpRoutes({
    AppRouter? appRouter,
    SwiftifyRepository? swiftifyRepository,
  }) async {
    final defaultAppRouter = appRouter ?? MockAppRouter();

    await pumpWidget(
      Provider.value(
        value: defaultAppRouter,
        child: RepositoryProvider.value(
          value: swiftifyRepository ?? _MockSwiftifyRepository(),
          child: MaterialApp.router(
            title: 'Swiftify',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: defaultAppRouter.routes,
            theme: const AppTheme().light,
          ),
        ),
      ),
    );
    await pump();
  }
}
