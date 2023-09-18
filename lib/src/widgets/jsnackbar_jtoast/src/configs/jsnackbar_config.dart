import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class JSnackbarConfig extends DefaultConfig {
  final Widget? title;
  final String? subTitle;
  final String? subTitleText;
  final Widget? leading;
  final Widget? trailing;
  final bool? durationVisibility;
  final bool? autoDismissed;

  JSnackbarConfig({
    this.title,
    this.subTitle,
    super.titleText,
    this.subTitleText,
    this.leading,
    this.trailing,
    super.forgroundColor,
    this.autoDismissed = true,
    this.durationVisibility = true,
    VoidCallback? onDismissed,
    BorderRadius? borderRadius,
    super.elevation,
    super.textStyle,
    super.padding,
    super.backgroundColor,
    super.curve,
    super.farFromEdge,
    super.duration,
    super.alignment,
    super.dismissDirection,
    super.animationDuration,
  }) : super(
            onDismissed: onDismissed ?? (() {}),
            borderRadius: borderRadius ?? BorderRadius.circular(6));

  JSnackbarConfig.icon(
    String msg, {
    required IconData icon,
    this.subTitleText,
    super.onDismissed,
    super.textStyle,
    super.backgroundColor,
    super.forgroundColor,
    this.autoDismissed = true,
    this.durationVisibility = true,
    BorderRadius? borderRadius,
  })  : leading = Icon(icon),
        title = null,
        subTitle = null,
        trailing = null,
        super(
          titleText: msg,
          borderRadius: borderRadius ?? BorderRadius.circular(6),
        );

  JSnackbarConfig.loading({
    String? text,
    super.onDismissed,
    super.textStyle,
    super.backgroundColor,
    super.forgroundColor,
    BorderRadius? borderRadius,
    Color? progressIndicatorColor,
  })  : leading = Builder(
            builder: (context) => CircularProgressIndicator(
                color: context.colorScheme.primaryContainer)),
        autoDismissed = false,
        durationVisibility = true,
        title = null,
        subTitle = null,
        subTitleText = null,
        trailing = null,
        super(
            titleText: text ?? 'Please Wait',
            borderRadius: borderRadius ?? BorderRadius.circular(6));
}
