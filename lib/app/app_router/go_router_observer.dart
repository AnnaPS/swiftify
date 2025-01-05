// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) print('[GoRouter] didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) print('[GoRouter] didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) print('[GoRouter] didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (kDebugMode) print('[GoRouter] didReplace: $newRoute');
  }
}
