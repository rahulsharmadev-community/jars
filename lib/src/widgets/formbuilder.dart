import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:jars/src/extensions/for_widgets/flex.dart';

class FormBuilder extends StatelessWidget {
  final String? title, subtitle, caption;
  final List<Widget> children;
  final List<Widget> actions;
  final MainAxisAlignment actionsAlignment;
  final TextStyle? titleStyle, subtitleStyle, captionStyle;

  /// Opacity value for the subtitle text.
  /// By default `subtitleOpacity = 0.7`
  final double subtitleOpacity;

  /// title and subtitle alignment
  final CrossAxisAlignment alignment;

  /// Gap between FormFieldJarModel
  final double verticalGap;
  final double horizontalGap;
  final EdgeInsetsGeometry padding;

  final VoidCallback? onChanged;
  final GlobalKey<FormState>? formKey;
  final Future<bool> Function()? onWillPop;
  const FormBuilder(
      {super.key,
      required this.children,
      this.actions = const [],
      this.title,
      this.subtitle,
      this.subtitleOpacity = 0.7,
      this.alignment = CrossAxisAlignment.start,
      this.verticalGap = 16,
      this.horizontalGap = 16,
      this.actionsAlignment = MainAxisAlignment.spaceEvenly,
      this.caption,
      this.titleStyle,
      this.subtitleStyle,
      this.captionStyle,
      this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 24),
      this.onChanged,
      this.formKey,
      this.onWillPop})
      : assert(formKey != null || (onChanged == null && onWillPop == null));

  @override
  Widget build(BuildContext context) {
    Widget returnChild = Padding(
      padding: EdgeInsets.only(bottom: context.mediaQuery.viewInsets.bottom),
      child: SingleChildScrollView(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: alignment,
          children: [
            if (title != null) Text(title!, style: context.textTheme.titleLarge).semiBold,
            if (subtitle != null) Text(subtitle!).opacity(0.7),
            if (title != null || title != null) 16.gap,
            ...children.map((child) {
              return child is Flex && child.direction == Axis.horizontal
                  ? child
                      .copyWith(
                          children: List<Widget>.generate(
                        child.children.length * 2 - 1,
                        (i) => i % 2 == 0 ? child.children[i ~/ 2] : verticalGap.gap,
                      ).toList())
                      .paddingOnly(bottom: horizontalGap)
                  : child.paddingOnly(bottom: horizontalGap);
            }),
            if (actions.isNotEmpty) Row(mainAxisAlignment: actionsAlignment, children: actions),
            if (caption != null)
              Center(
                  child: Text(caption!, textAlign: TextAlign.center)
                      .paddingOnly(bottom: 4, top: 16)
                      .opacity(0.5))
          ],
        ),
      ),
    );

    return formKey != null
        ? Form(
            key: formKey,
            onChanged: onChanged,
            onWillPop: onWillPop,
            child: returnChild,
          )
        : returnChild;
  }
}
