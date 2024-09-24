import 'package:flutter/material.dart' hide Route;
import 'package:jars_core/jars_core.dart';
import 'route.dart';
import 'package:go_router/go_router.dart';
part 'go_router_config.dart';

class GoMaterialApp extends MaterialApp {
  GoMaterialApp(
      {super.key,
      required GoRouterConfig config,
      super.backButtonDispatcher,
      super.builder,
      super.title,
      super.onGenerateTitle,
      super.onNavigationNotification,
      super.color,
      super.theme,
      super.darkTheme,
      super.highContrastTheme,
      super.highContrastDarkTheme,
      super.themeMode,
      super.themeAnimationDuration,
      super.themeAnimationCurve,
      super.locale,
      super.localizationsDelegates,
      super.localeListResolutionCallback,
      super.localeResolutionCallback,
      super.supportedLocales,
      super.debugShowMaterialGrid,
      super.showPerformanceOverlay,
      super.checkerboardRasterCacheImages,
      super.checkerboardOffscreenLayers,
      super.showSemanticsDebugger,
      super.debugShowCheckedModeBanner,
      super.shortcuts,
      super.actions,
      super.restorationScopeId,
      super.scrollBehavior,
      super.themeAnimationStyle})
      : super.router(
          routerConfig: config.goRouter,
          scaffoldMessengerKey: config.messengerKey,
        );
}
