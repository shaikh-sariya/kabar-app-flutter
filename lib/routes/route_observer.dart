import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Custom route observer for tracking changes in the navigation stack.
///
/// This class extends [RouteObserver] and provides overrides for methods
/// such as `didPop`, `didPush`, and `didRemove` to log information about route
/// changes when the app is running in debug mode.
class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  /// Called when a route has been popped off the navigation stack.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print('Route popped: $route');
    }
  }

  /// Called when a new route has been pushed onto the navigation stack.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print('Route pushed: $route');
    }
  }

  /// Called when a route has been removed from the navigation stack.
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print('Route removed: $route');
    }
  }
}
