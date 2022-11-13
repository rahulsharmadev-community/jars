import 'package:flutter/material.dart';
import 'package:jars/core/library_core.dart';
import 'default_config.dart';

class RToastConfig extends DefaultConfig {
  RToastConfig({
    Curve? curve,
    Duration? duration,
    Duration? animationDuration,
    Color? backgroundColor,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    Alignment? alignment,
    DismissDirection? dismissDirection,
    double? farFromEdge,
    EdgeInsets? padding,
    VoidCallback? onDismissed,
  }) : super(
            curve: curve ?? Curves.decelerate,
            duration: duration ?? const Duration(seconds: 2),
            animationDuration:
                animationDuration ?? const Duration(milliseconds: 250),
            backgroundColor: backgroundColor ?? Colors.black54,
            textStyle:
                textStyle ?? TextStyle(fontSize: 12.dp, color: Colors.white),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
            alignment: alignment ?? Alignment.bottomCenter,
            dismissDirection: dismissDirection ?? DismissDirection.none,
            farFromEdge: farFromEdge ?? kToolbarHeight,
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 12.0.dp, vertical: 8.0.dp),
            onDismissed: onDismissed ?? () {});

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
