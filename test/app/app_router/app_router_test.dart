import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/app/app_router/app_router.dart';
import 'package:swiftify/app/app_router/routes/dashboard_routes.dart';
import 'package:swiftify/favorites/favorites.dart';
import 'package:swiftify/theme/theme.dart';

import '../../helpers/helpers.dart';

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouteInformationProvider extends Mock
    implements GoRouteInformationProvider {}

class _MockGoRouteInformationParser extends Mock
    implements GoRouteInformationParser {}

class _MockGoRouterDelegate extends Mock implements GoRouterDelegate {}

void main() {
  group('AppRouter', () {
    late GoRouter goRouter;
    late AppRouter appRouter;

    setUp(() {
      goRouter = _MockGoRouter();
      appRouter = AppRouter();

      when(() => goRouter.go(any())).thenReturn(null);
      when(() => goRouter.push(any())).thenAnswer((_) async => {});
      when(goRouter.pop).thenReturn(null);
      when(goRouter.canPop).thenReturn(true);
      when(() => goRouter.routeInformationProvider)
          .thenReturn(_MockGoRouteInformationProvider());
      when(() => goRouter.routeInformationParser)
          .thenReturn(_MockGoRouteInformationParser());
      when(() => goRouter.routerDelegate).thenReturn(_MockGoRouterDelegate());
    });

    test('can be instantiated', () {
      expect(
        appRouter,
        isNotNull,
      );
    });

    test('can get routes', () {
      expect(
        appRouter.routes,
        isNotNull,
      );
    });

    group('navigates', () {
      testWidgets('to AlbumPage', (tester) async {
        await tester.pumpRoutes(
          appRouter: appRouter,
        );

        appRouter.routes.go(AlbumPageRoute.routeName);

        await tester.pumpAndSettle();
        expect(find.byType(AlbumPage), findsOneWidget);
      });

      testWidgets('to FavoritesPage', (tester) async {
        await tester.pumpRoutes(
          appRouter: appRouter,
        );

        final bottomNav = tester.widget<BottomNavigationBar>(
          find.byType(BottomNavigationBar),
        );

        bottomNav.onTap!(1);
        appRouter.routes.go(FavoritesPageRoute.routeName);

        await tester.pumpAndSettle();
        expect(find.byType(FavoritesPage), findsOneWidget);
      });

      testWidgets('to ThemeBottomSheet', (tester) async {
        await tester.pumpRoutes(
          appRouter: appRouter,
        );

        final iconButton = tester.widget<IconButton>(
          find.byType(IconButton),
        );

        iconButton.onPressed!();
        appRouter.routes.go(ThemePageRoute.routeName);

        await tester.pumpAndSettle();
        expect(find.byType(ThemeBottomSheet), findsOneWidget);
      });
    });
  });
}
