part of 'toast.dart';

class RToastConfig {
  final Curve curve;
  final Duration duration;
  final Duration animationDuration;
  final Color backgroundColor;
  final TextStyle textStyle;
  final BorderRadius borderRadius;
  final Alignment alignment;
  final DismissDirection dismissDirection;
  final double farFromEdge;
  final EdgeInsets padding;
  final VoidCallback? onDismissed;

  RToastConfig({
    this.onDismissed,
    EdgeInsets? padding,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    this.curve = Curves.decelerate,
    this.farFromEdge = kToolbarHeight,
    this.alignment = Alignment.bottomCenter,
    this.duration = const Duration(seconds: 2),
    this.dismissDirection = DismissDirection.none,
    this.animationDuration = const Duration(milliseconds: 250),
  })  : this.padding = padding ??
            EdgeInsets.symmetric(horizontal: 12.0.dp, vertical: 8.0.dp),
        this.backgroundColor = backgroundColor ?? Colors.black54,
        this.borderRadius = borderRadius ?? BorderRadius.circular(100),
        this.textStyle =
            textStyle ?? TextStyle(fontSize: 12.dp, color: Colors.white);

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
