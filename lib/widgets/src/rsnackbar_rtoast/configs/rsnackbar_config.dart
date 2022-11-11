import 'package:flutter/material.dart';
import 'package:jars/core/library_core.dart';
import 'default_config.dart';

class RSnackbarConfig extends DefaultConfig {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final double? elevation;
  final Color? forgroundColor;
  final bool? durationVisibility;
  final bool? autoDismissed;
  RSnackbarConfig(this.title,
      {this.leading,
      this.trailing,
      this.elevation = 0,
      this.forgroundColor = Colors.white,
      this.autoDismissed = true,
      this.durationVisibility = true,
      VoidCallback? onDismissed,
      EdgeInsets? padding,
      Color? backgroundColor,
      BorderRadius? borderRadius,
      TextStyle? textStyle,
      Curve? curve,
      double? farFromEdge,
      Alignment? alignment,
      Duration? duration,
      DismissDirection? dismissDirection,
      Duration? animationDuration})
      : super(
            curve: curve ?? Curves.decelerate,
            duration: duration ?? const Duration(seconds: 2),
            animationDuration:
                animationDuration ?? const Duration(milliseconds: 250),
            backgroundColor: backgroundColor ?? Colors.black,
            textStyle:
                textStyle ?? TextStyle(fontSize: 15.sp, color: Colors.white),
            borderRadius: borderRadius ?? BorderRadius.circular(100),
            alignment: alignment ?? Alignment.bottomCenter,
            dismissDirection: dismissDirection ?? DismissDirection.none,
            farFromEdge: farFromEdge ?? kToolbarHeight,
            padding: padding ?? const EdgeInsets.fromLTRB(16, 8, 16, 8),
            onDismissed: onDismissed ?? () {});
}

class RSnackbarIconConfig extends RSnackbarConfig {
  RSnackbarIconConfig(String msg, IconData icon,
      {VoidCallback? onCancel,
      TextStyle? textStyle,
      BorderRadius? borderRadius,
      Color backgroundColor = Colors.black,
      Color forgroundColor = Colors.white,
      bool durationVisibility = true})
      : super(Text(msg, maxLines: 2, overflow: TextOverflow.ellipsis),
            leading: Icon(icon, color: forgroundColor),
            onDismissed: onCancel,
            textStyle: textStyle,
            borderRadius: borderRadius,
            backgroundColor: backgroundColor,
            forgroundColor: forgroundColor,
            durationVisibility: durationVisibility);
}

class RSnackbarLoadingConfig extends RSnackbarConfig {
  RSnackbarLoadingConfig(
    String msg, {
    VoidCallback? onCancel,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    Color backgroundColor = Colors.black,
    Color? progressIndicatorColor,
    Color forgroundColor = Colors.white,
  }) : super(Text(msg, maxLines: 2, overflow: TextOverflow.ellipsis),
            leading: CircularProgressIndicator(color: progressIndicatorColor),
            onDismissed: onCancel,
            textStyle: textStyle,
            autoDismissed: false,
            forgroundColor: forgroundColor,
            borderRadius: borderRadius,
            backgroundColor: backgroundColor,
            durationVisibility: false);
}
