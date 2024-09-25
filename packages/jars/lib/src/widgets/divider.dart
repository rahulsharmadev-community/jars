import 'package:flutter/material.dart';

enum JDividerAlignment {
  start,
  center,
  end,
}

class JDivider extends StatelessWidget {
  /// Creates a Material Design divider.
  ///
  /// The [height], [thickness], [indent], and [endIndent] must be null or
  /// non-negative.
  const JDivider({
    super.key,
    this.text,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.textWidget,
    this.dividerRadius,
    this.textAlign,
    this.textPadding,
  })  : assert(thickness == null || thickness >= 0.0),
        assert(indent == null || indent >= 0.0),
        assert(endIndent == null || endIndent >= 0.0);

  final Widget? textWidget;

  final String? text;

  final JDividerAlignment? textAlign;

  final double? dividerRadius;

  final EdgeInsetsGeometry? textPadding;

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// height of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used. If
  /// that is also null, then this defaults to 0.0.
  final double? thickness;

  /// The amount of empty space to the leading edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? endIndent;

  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// const Divider(
  ///   color: Colors.deepOrange,
  /// )
  /// ```
  /// {@end-tool}
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final DividerThemeData dividerTheme = DividerTheme.of(context);
    final double thickness = this.thickness ?? dividerTheme.thickness ?? dividerTheme.thickness ?? 1;
    final double indent = this.indent ?? dividerTheme.indent ?? dividerTheme.indent ?? 0;
    final double endIndent = this.endIndent ?? dividerTheme.endIndent ?? dividerTheme.endIndent ?? 0;

    final divider = Container(
      height: thickness,
      margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
      decoration: BoxDecoration(
          border: Border(bottom: Divider.createBorderSide(context, color: color, width: thickness)),
          borderRadius: BorderRadius.circular(dividerRadius ?? 16)),
    );

    Widget? child = text != null
        ? Padding(padding: textPadding ?? const EdgeInsets.symmetric(horizontal: 4), child: Text(text!))
        : textWidget;

    if (child != null) {
      final textAlign = this.textAlign ?? JDividerAlignment.center;
      child = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (i) => textAlign.index == i ? child! : Expanded(child: divider)));
    } else {
      child = divider;
    }

    return child;
  }
}
