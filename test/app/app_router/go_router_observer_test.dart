import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/app/app_router/app_router.dart';

class _MockRoute extends Mock implements Route<dynamic> {}

void main() {
  final log = <String>[];

  late final Route<dynamic> route;
  late final Route<dynamic> previousRoute;
  late GoRouterObserver goRouterObserver;

  setUpAll(() {
    route = _MockRoute();
    previousRoute = _MockRoute();
    goRouterObserver = GoRouterObserver();
  });

  group('GoRouterObserver', () {
    void Function() overridePrint(void Function() testFn) => () {
          final spec = ZoneSpecification(
            print: (_, __, ___, String msg) {
              log.add(msg);
            },
          );
          return Zone.current.fork(specification: spec).run<void>(testFn);
        };

    setUp(log.clear);

    test(
      'prints request on didPush',
      overridePrint(() {
        goRouterObserver.didPush(route, previousRoute);

        expect(
          log[0],
          equals('[GoRouter] didPush: $route'),
        );
      }),
    );

    test(
      'prints request on didPop',
      overridePrint(() {
        goRouterObserver.didPop(route, previousRoute);

        expect(
          log[0],
          equals('[GoRouter] didPop: $route'),
        );
      }),
    );

    test(
      'prints request on didRemove',
      overridePrint(() {
        goRouterObserver.didRemove(route, previousRoute);

        expect(
          log[0],
          equals('[GoRouter] didRemove: $route'),
        );
      }),
    );

    test(
      'prints request on didReplace',
      overridePrint(() {
        goRouterObserver.didReplace(newRoute: route, oldRoute: previousRoute);

        expect(
          log[0],
          equals('[GoRouter] didReplace: $route'),
        );
      }),
    );
  });
}
