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
