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
  }) : path = (path ?? '/$name') + fid;

  Route<T> copyWith({
    String? name,
    String? path,
    T Function(BuildContext, GoRouterState)? builder,
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
    FutureOr<bool> Function(BuildContext, GoRouterState)? onExit,
  }) =>
      Route<T>(
        name: name ?? this.name,
        path: path ?? this.path,
        builder: builder ?? this.builder,
        redirect: redirect ?? this.redirect,
        onExit: onExit ?? this.onExit,
      );
}

class FadeTransitionPage extends CustomTransitionPage {
  FadeTransitionPage({required super.child})
      : super(transitionsBuilder: (ctx, anim, secAnim, child) {
          return FadeTransition(opacity: anim, child: child);
        });
}

class JRoute extends GoRoute {
  final Route route;
  final List<JRoute> jroutes;

  JRoute(
    this.route, {
    this.jroutes = const [],
    super.parentNavigatorKey,
  }) : super(
          name: route.name,
          path: route.path,
          onExit: route.onExit,
          redirect: route.redirect,
          routes: jroutes.map((e) {
            var substring = e.route.path.substring(1);
            return JRoute(e.route.copyWith(path: substring),
                jroutes: e.jroutes, parentNavigatorKey: parentNavigatorKey);
          }).toList(),
          pageBuilder: _paser<GoRouterPageBuilder>(route.builder),
          builder: _paser<GoRouterWidgetBuilder>(route.builder),
        );

  static T? _paser<T>(var value) => value is T ? value : null;
}
