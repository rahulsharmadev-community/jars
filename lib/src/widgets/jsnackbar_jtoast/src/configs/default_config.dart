import 'package:flutter/material.dart';

/// Required properties for rtoast and rsnackbar
abstract class DefaultConfig {
  final String? titleText;
  final double elevation;
  final Color? forgroundColor;
  final Curve curve;
  final Duration duration;
  final Duration animationDuration;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final BorderRadius borderRadius;
  final Alignment alignment;
  final DismissDirection dismissDirection;
  final double farFromEdge;
  final EdgeInsets padding, margin;
  final TextAlign textAlign;
  final VoidCallback? onDismissed;

  const DefaultConfig({
    this.forgroundColor,
    this.titleText,
    this.elevation = 0,
    this.padding = const EdgeInsets.fromLTRB(12, 8, 12, 8),
    this.curve = Curves.decelerate,
    this.farFromEdge = kToolbarHeight,
    this.duration = const Duration(seconds: 2),
    this.alignment = Alignment.bottomCenter,
    this.dismissDirection = DismissDirection.none,
    this.animationDuration = const Duration(milliseconds: 250),
    this.backgroundColor,
    this.textStyle,
    this.onDismissed,
    this.textAlign = TextAlign.left,
    this.borderRadius = BorderRadius.zero,
    this.margin = const EdgeInsets.symmetric(horizontal: 28),
  });
}
