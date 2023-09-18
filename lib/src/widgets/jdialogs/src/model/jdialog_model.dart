import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

abstract class JDialogModel extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle, subtitleStyle;

  /// Opacity value for the subtitle text.
  /// By default `subtitleOpacity = 0.7`
  final double subtitleOpacity;
  final Widget? icon;
  final JDialogConfig config;
  final List<Widget> actions;
  final MainAxisAlignment actionsAlignment;
  const JDialogModel({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.icon,
    this.config = const JDialogConfig(),
    this.actions = const [],
    this.actionsAlignment = MainAxisAlignment.spaceEvenly,
    this.subtitleOpacity = 0.7,
  });
}
