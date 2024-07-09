import 'package:flutter/widgets.dart';
import 'package:jars/jars.dart' hide  Route; 

/// An observer for monitoring route changes in the navigator.
class RouteNavigatorObserver extends NavigatorObserver {
  final List<String> _routeStack = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateRouteStack(route.settings.name);
    _logRouteChange('PUSH', route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_routeStack.isNotEmpty) _routeStack.removeLast();
    _logRouteChange('POP', previousRoute, route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _removeRouteFromStack(previousRoute?.settings.name);
    _logRouteChange('REMOVE', route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute == null || oldRoute == null) return;
    _replaceRouteInStack(oldRoute.settings.name, newRoute.settings.name);
    _logRouteChange('REPLACE', newRoute, oldRoute);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteChange('START_USER_GESTURE', route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    log.i('STOP_USER_GESTURE');
  }

  void _updateRouteStack(String? routeName) {
    if (routeName != null) _routeStack.add(routeName);
  }

  void _removeRouteFromStack(String? routeName) {
    _routeStack.removeWhere((name) => name == routeName);
  }

  void _replaceRouteInStack(String? oldRouteName, String? newRouteName) {
    for (int i = _routeStack.length - 1; i >= 0; i--) {
      if (_routeStack[i] == oldRouteName) {
        _routeStack[i] = newRouteName!;
        break;
      }
    }
  }

  void _logRouteChange(String action, Route<dynamic>? route, Route<dynamic>? previousRoute) {
    log.t({
      'ACTION': action,
      'ACTIVE_ROUTE': route?.settings.name ?? 'NULL',
      'PREVIOUS_ROUTE': previousRoute?.settings.name ?? 'NULL',
      'ROUTE_STACK': _routeStack.join(' / '),
    });
  }
}
