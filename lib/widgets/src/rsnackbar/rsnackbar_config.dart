part of 'snackbar.dart';

class RSnackbarConfig {
  late final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final Curve curve;
  final double elevation;
  final Duration duration;
  final TextStyle textStyle;
  final Alignment alignment;
  final double farFromEdge;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color forgroundColor;
  final BorderRadius borderRadius;
  final bool durationVisibility;
  final VoidCallback? onDismissed;
  final Duration animationDuration;
  final bool autoDismissed;
  final DismissDirection dismissDirection;
  RSnackbarConfig(
    this.title, {
    this.leading,
    this.trailing,
    this.onDismissed,
    Color? forgroundColor,
    Color? backgroundColor,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    this.elevation = 0,
    this.curve = Curves.decelerate,
    this.farFromEdge = kToolbarHeight,
    this.alignment = Alignment.bottomCenter,
    this.autoDismissed = true,
    this.durationVisibility = true,
    this.duration = const Duration(seconds: 2),
    this.dismissDirection = DismissDirection.none,
    this.animationDuration = const Duration(milliseconds: 250),
  })  : this.padding = padding ?? const EdgeInsets.fromLTRB(16, 8, 16, 8),
        this.forgroundColor = forgroundColor ?? Colors.white,
        this.backgroundColor = backgroundColor ?? Colors.black,
        this.borderRadius = borderRadius ?? BorderRadius.circular(100),
        this.textStyle =
            textStyle ?? TextStyle(fontSize: 15.sp, color: Colors.white);
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
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            borderRadius: borderRadius,
            backgroundColor: backgroundColor,
            durationVisibility: false);
}
