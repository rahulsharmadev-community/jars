import 'package:flutter/material.dart';
import 'default_config.dart';

class JToastConfig extends DefaultConfig {
  JToastConfig(
      {VoidCallback? onDismissed,
      BorderRadius? borderRadius,
      super.titleText,
      super.textStyle,
      super.padding,
      super.backgroundColor,
      super.curve,
      super.farFromEdge,
      super.duration,
      super.alignment,
      super.dismissDirection,
      super.animationDuration,
      super.elevation,
      super.margin,
      super.forgroundColor,
      super.textAlign = TextAlign.center})
      : super(
            onDismissed: onDismissed ?? (() {}),
            borderRadius: borderRadius ?? BorderRadius.circular(100));

  JToastConfig copyWith(
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
          EdgeInsets? padding,
          double? elevation,
          TextAlign? textAlign,
          Color? forgroundColor,
          String? titleText,
          EdgeInsets? margin}) =>
      JToastConfig(
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
        padding: padding ?? this.padding,
        elevation: elevation ?? this.elevation,
        forgroundColor: forgroundColor ?? this.forgroundColor,
        margin: margin ?? this.margin,
        textAlign: textAlign ?? this.textAlign,
        titleText: titleText ?? this.titleText,
      );
}
