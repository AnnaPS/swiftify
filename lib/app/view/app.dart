import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/app/app_router/app_router.dart';
import 'package:swiftify/l10n/l10n.dart';
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
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepPurple[50],
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: AppRouter(
          navigatorObservers: [GoRouterObserver()],
        ).routes,
      ),
    );
  }
}
