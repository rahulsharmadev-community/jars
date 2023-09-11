import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'configs/jdialog_config.dart';

class InfoJDialog extends StatelessWidget {
  final String title, content;
  final String? caption;
  final Widget? icon;
  final JDialogConfig config;

  final TextStyle? titleStyle, contentStyle;
  final double opacity;
  const InfoJDialog(
      {super.key,
      required this.title,
      required this.content,
      this.icon,
      this.opacity = 0.7,
      this.config = const JDialogConfig(),
      this.titleStyle,
      this.contentStyle,
      this.caption});

  @override
  Widget build(BuildContext context) {
    final child = SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!.fittedBox(72),
          18.gap,
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle ?? context.textTheme.headlineMedium,
          ),
          if (caption != null)
            Text(caption!, style: context.textTheme.labelMedium),
          8.gap,
          Text(
            content,
            textAlign: TextAlign.center,
            style: contentStyle,
          ).opacity(opacity),
        ],
      ),
    );

    return config.createDialog(context, child);
  }
}
