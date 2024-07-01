// ignore_for_file: unused_element

part of 'go_material_app.dart';

abstract class GoRouterConfig {
  late final GoRouter goRouter;
  final GlobalKey<ScaffoldMessengerState> messengerKey;
  final GlobalKey<NavigatorState> rootNavigatorKey;
  GoRouterConfig()
      : messengerKey = GlobalKey<ScaffoldMessengerState>(),
        rootNavigatorKey = GlobalKey<NavigatorState>() {
    goRouter = config;
  }

  GoRouter get config;

  RouteMatchList get currentConfig => goRouter.routerDelegate.currentConfiguration;

  BuildContext get currentContext => rootNavigatorKey.currentContext!;
}

extension GoRouterConfigHelper on GoRouterConfig {
// If popCount is 1, the optional result parameter will be used.
// Otherwise, popCount determines how many times the context will be popped.
  void pop<T extends Object?>({T? result, int popCount = 1}) {
    if (popCount == 1) {
      return currentContext.pop(result);
    } else {
      while (popCount > 0) {
        currentContext.pop();
        popCount--;
      }
    }
  }

  String namedLocation(Route route, {JSON<String> pathParams = const {}, JSON queryParams = const {}}) =>
      currentContext.namedLocation(route.name, pathParameters: pathParams, queryParameters: queryParams);

  void go(String location, {Object? extra}) => currentContext.go(location, extra: extra);

  void goNamed(Route route,
          {JSON<String> pathParams = const {}, JSON queryParams = const {}, Object? extra}) =>
      currentContext.goNamed(route.name,
          pathParameters: pathParams, queryParameters: queryParams, extra: extra);

  Future<T?> push<T extends Object?>(String location, {Object? extra}) =>
      currentContext.push<T>(location, extra: extra);

  Future<T?> pushNamed<T extends Object?>(Route route,
          {JSON<String> pathParams = const {}, JSON queryParams = const {}, Object? extra}) =>
      currentContext.pushNamed<T>(route.name,
          pathParameters: pathParams, queryParameters: queryParams, extra: extra);

  bool canPop() => currentContext.canPop();

  void pushReplacement(String location, {Object? extra}) =>
      currentContext.pushReplacement(location, extra: extra);

  void pushReplacementNamed(Route route,
          {JSON<String> pathParams = const {}, JSON queryParams = const {}, Object? extra}) =>
      currentContext.pushReplacementNamed(route.name,
          pathParameters: pathParams, queryParameters: queryParams, extra: extra);

  void replace(String location, {Object? extra}) => currentContext.replace(location, extra: extra);

  void replaceNamed(Route route,
          {JSON<String> pathParams = const {}, JSON queryParams = const {}, Object? extra}) =>
      currentContext.replaceNamed(route.name,
          pathParameters: pathParams, queryParameters: queryParams, extra: extra);
}
