import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/app/app_router/app_router.dart';
import 'package:swiftify/l10n/l10n.dart';
import 'package:swiftify/theme/app_theme.dart';
import 'package:swiftify/theme/bloc/theme_bloc.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class App extends StatefulWidget {
  const App({
    required SwiftifyRepository swiftifyRepository,
    super.key,
  }) : _swiftifyRepository = swiftifyRepository;

  final SwiftifyRepository _swiftifyRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget._swiftifyRepository,
      child: BlocProvider(create: (_) => ThemeBloc(), child: const AppView()),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    const appTheme = AppTheme();

    return MaterialApp.router(
      themeMode: context.watch<ThemeBloc>().state,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      highContrastDarkTheme: const AppTheme().darkHighContrast,
      highContrastTheme: const AppTheme().lightHighContrast,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter(
        navigatorObservers: [GoRouterObserver()],
      ).routes,
    );
  }
}
