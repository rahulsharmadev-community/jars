import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

const _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);


class JDialogConfig {
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Duration insetAnimationDuration;
  final double elevation;
  final ShapeBorder shape;

  /// Defaults to [Curves.decelerate].
  final Curve insetAnimationCurve;
  const JDialogConfig({
    this.backgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation = 6.0,
    this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28.0))),
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
  }) : assert(elevation >= 0.0, 'elevation should be greater then 0.0');

  Widget createDialog(BuildContext context, Widget child) {
    final dialogTheme = DialogTheme.of(context);

    double minWidth = 280.0;
    double maxWidth = minWidth * 2;
    final dialogChild = Align(
      alignment: dialogTheme.alignment ?? Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: minWidth, maxWidth: maxWidth < 280 ? 280 : maxWidth),
        child: Material(
          type: MaterialType.card,
          color: backgroundColor ??
              dialogTheme.backgroundColor ??
              context.theme.dialogBackgroundColor,
          shadowColor:
              shadowColor ?? dialogTheme.shadowColor ?? Colors.transparent,
          surfaceTintColor: surfaceTintColor ??
              dialogTheme.surfaceTintColor ??
              context.colorScheme.surfaceTint,
          shape: shape,
          clipBehavior: Clip.hardEdge,
          elevation: elevation,
          child: child,
        ),
      ),
    );

    final EdgeInsets effectivePadding =
        MediaQuery.viewInsetsOf(context) + _defaultInsetPadding;
    return AnimatedPadding(
        padding: effectivePadding,
        duration: insetAnimationDuration,
        curve: insetAnimationCurve,
        child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: dialogChild));
  }
}
