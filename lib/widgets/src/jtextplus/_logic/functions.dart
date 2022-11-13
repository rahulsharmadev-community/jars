import 'package:flutter/material.dart';
import '../models/jtextstyle.dart';
import 'decorator.dart';

/// Returns textSpan with decorated tagged text
TextSpan getChildTextSpan({
  required String source,
  required TextStyle? defaultStyle,
  required List<JTextStyle> jStyles,
}) {
  final decorations = Decorator(rules: jStyles).getDecorations(source, jStyles);
  if (decorations.isEmpty) {
    return TextSpan(text: source, style: defaultStyle);
  } else {
    decorations.sort();
    final span = decorations
        .map((item) {
          String text = item.range.textInside(source);
          if (item.rule?.transformMatch != null) {
            text = item.rule!.transformMatch!(text);
          }
          return TextSpan(
            children: [
              TextSpan(
                text: text,
                style: item.rule,
                recognizer: item.rule?.recognizer != null
                    ? item.rule?.recognizer!(text)
                    : null,
              ),
            ],
          );
        })
        .whereType<TextSpan>()
        .toList();

    return TextSpan(children: span, style: defaultStyle);
  }
}
