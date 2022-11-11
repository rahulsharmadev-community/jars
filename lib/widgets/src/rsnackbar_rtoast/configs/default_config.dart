import 'package:flutter/material.dart';

/// Required properties for rtoast and rsnackbar
abstract class DefaultConfig {
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
  final VoidCallback onDismissed;

  const DefaultConfig(
      {required this.curve,
      required this.duration,
      required this.animationDuration,
      required this.backgroundColor,
      required this.textStyle,
      required this.borderRadius,
      required this.alignment,
      required this.dismissDirection,
      required this.farFromEdge,
      required this.padding,
      required this.onDismissed});
}
