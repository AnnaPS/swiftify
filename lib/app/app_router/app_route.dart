import 'package:go_router/go_router.dart';

class AppRoute extends GoRoute {
  AppRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.routes = const <RouteBase>[],
  });

  @override
  GoRouterRedirect get redirect => (context, state) {
        return null;
      };
}
