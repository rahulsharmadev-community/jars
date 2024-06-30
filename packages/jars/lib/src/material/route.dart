import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Route<T> {
  final String name, fid;
  final String path;
  final T Function(BuildContext, GoRouterState)? builder;
  final FutureOr<String?> Function(BuildContext, GoRouterState)? redirect;
  final FutureOr<bool> Function(BuildContext, GoRouterState)? onExit;
  Route({
    required this.name,
    this.builder,
    String? path,
    this.fid = '',
    this.redirect,
    this.onExit,
  })  : assert(builder != null || redirect != null, 'builder, or redirect must be provided'),
        assert(builder is GoRouterPageBuilder || redirect is GoRouterWidgetBuilder,
            'Builder method should only return Widget or Page<void>.'),
        path = (path ?? '/$name') + fid;
}

class FadeTransitionPage extends CustomTransitionPage {
  FadeTransitionPage({required super.child})
      : super(transitionsBuilder: (ctx, anim, secAnim, child) {
          return FadeTransition(opacity: anim, child: child);
        });
}

class JRoute extends GoRoute {
  JRoute(
    Route route, {
    super.routes,
    super.parentNavigatorKey,
  }) : super(
          name: route.name,
          path: route.path,
          onExit: route.onExit,
          redirect: route.redirect,
          pageBuilder: _paser<GoRouterPageBuilder>(route.builder),
          builder: _paser<GoRouterWidgetBuilder>(route.builder),
        );

  static T? _paser<T>(var value) => value is T ? value : null;
}
