import 'package:flutter/material.dart';
import 'package:jars/core/library_core.dart';
import 'default_config.dart';

class RToastConfig implements DefaultConfig {
  @override
  Alignment alignment;

  @override
  Duration animationDuration;

  @override
  Color backgroundColor;

  @override
  BorderRadius borderRadius;

  @override
  Curve curve;

  @override
  DismissDirection dismissDirection;

  @override
  Duration duration;

  @override
  double farFromEdge;

  @override
  VoidCallback onDismissed;

  @override
  EdgeInsets padding;

  @override
  TextStyle textStyle;

  RToastConfig(
      {VoidCallback? onDismissed,
      BorderRadius? borderRadius,
      TextStyle? textStyle,
      this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
      this.backgroundColor = Colors.black,
      this.curve = Curves.decelerate,
      this.farFromEdge = kToolbarHeight,
      this.duration = const Duration(seconds: 2),
      this.alignment = Alignment.bottomCenter,
      this.dismissDirection = DismissDirection.none,
      this.animationDuration = const Duration(milliseconds: 250)})
      : onDismissed = onDismissed ?? (() {}),
        borderRadius = borderRadius ?? BorderRadius.circular(100),
        textStyle =
            textStyle ?? TextStyle(fontSize: 15.sp, color: Colors.white);

  RToastConfig copyWith(
          {Curve? curve,
          Duration? duration,
          Duration? animationDuration,
          Color? backgroundColor,
          TextStyle? textStyle,
          double? farFromEdge,
          BorderRadius? borderRadius,
          Alignment? alignment,
          DismissDirection? dismissDirection,
          VoidCallback? onDismissed,
          EdgeInsets? padding}) =>
      RToastConfig(
          alignment: alignment ?? this.alignment,
          farFromEdge: farFromEdge ?? this.farFromEdge,
          animationDuration: animationDuration ?? this.animationDuration,
          backgroundColor: backgroundColor ?? this.backgroundColor,
          borderRadius: borderRadius ?? this.borderRadius,
          onDismissed: onDismissed ?? this.onDismissed,
          curve: curve ?? this.curve,
          dismissDirection: dismissDirection ?? this.dismissDirection,
          duration: duration ?? this.duration,
          textStyle: textStyle ?? this.textStyle,
          padding: padding ?? this.padding);
}
