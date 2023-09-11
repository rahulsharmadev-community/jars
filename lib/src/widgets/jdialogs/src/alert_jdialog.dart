import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'configs/jdialog_config.dart';

class AlertJDialog extends StatelessWidget {
  final String title, content;
  final Widget? icon;
  final JDialogConfig config;
  final TextStyle? buttonsStyle, titleStyle, contentStyle;
  final JDialogButtonConfig<String> button1;
  final JDialogButtonConfig<String>? button2;
  final MainAxisAlignment buttonAlignment;

  final double opacity;
  const AlertJDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.button1,
      this.button2,
      this.icon,
      this.config = const JDialogConfig(),
      this.buttonsStyle,
      this.opacity = 0.7,
      this.buttonAlignment = MainAxisAlignment.spaceEvenly,
      this.titleStyle,
      this.contentStyle});

  @override
  Widget build(BuildContext context) {
    var buttonWidget_1 = ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: button1.color,
          textStyle: buttonsStyle,
        ),
        onPressed: button1.onTap,
        child: Text(button1.text));

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
          8.gap,
          Text(
            content,
            textAlign: TextAlign.center,
            style: contentStyle,
          ).opacity(opacity),
          28.gap,
          Row(
            mainAxisAlignment: buttonAlignment,
            children: [
              if (button2 != null)
                Flexible(
                  fit: FlexFit.values[button2!.enabledfullSize ? 0 : 1],
                  child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: button2?.color,
                            textStyle: buttonsStyle,
                          ),
                          onPressed: button2?.onTap,
                          child: Text(button2!.text, style: buttonsStyle))
                      .paddingOnly(right: 8),
                ),
              Flexible(
                fit: FlexFit.values[button1.enabledfullSize ? 0 : 1],
                child: buttonWidget_1.paddingOnly(left: 8),
              ),
            ],
          )
        ],
      ),
    );

    return config.createDialog(context, child);
  }
}
