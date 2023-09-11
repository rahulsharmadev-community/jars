import 'package:flutter/material.dart';
import 'package:jars/utility.dart';
import 'default_config.dart';

class JSnackbarConfig implements DefaultConfig {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final double? elevation;
  final Color? forgroundColor;
  final bool? durationVisibility;
  final bool? autoDismissed;

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
  JSnackbarConfig(this.title,
      {this.leading,
      this.trailing,
      this.elevation = 0,
      this.forgroundColor = Colors.white,
      this.autoDismissed = true,
      this.durationVisibility = true,
      VoidCallback? onDismissed,
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
}

class RSnackbarIconConfig extends JSnackbarConfig {
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

class RSnackbarLoadingConfig extends JSnackbarConfig {
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
