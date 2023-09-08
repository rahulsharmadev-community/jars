import 'package:flutter/material.dart';

/// Required properties for rtoast and rsnackbar
abstract class DefaultConfig {
  late final Curve curve;
  late final Duration duration;
  late final Duration animationDuration;
  late final Color backgroundColor;
  late final TextStyle textStyle;
  late final BorderRadius borderRadius;
  late final Alignment alignment;
  late final DismissDirection dismissDirection;
  late final double farFromEdge;
  late final EdgeInsets padding;
  late final VoidCallback onDismissed;
}
