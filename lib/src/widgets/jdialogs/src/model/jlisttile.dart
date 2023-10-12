import 'package:flutter/material.dart';

enum JListTileAlignment {
  beforeLeading,
  beforeTrailing,
  afterLeading,
  afterTrailing,
}

class JListTile extends StatelessWidget {
  final String uniqueKey;
  final Widget? indicator, leading, title, subtitle, trailing;
  final Color? tileColor;
  final Decoration? decoration;
  final JListTileAlignment alignment;
  JListTile({
    required String key,
    this.indicator,
    this.decoration,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.tileColor,
    this.alignment = JListTileAlignment.afterTrailing,
  })  : uniqueKey = key,
        super(key: Key(key));

  JListTile copyWidth(
          {Widget? indicator,
          Widget? leading,
          Widget? title,
          Widget? subtitle,
          Widget? trailing,
          Color? tileColor,
          Decoration? decoration,
          JListTileAlignment? alignment}) =>
      JListTile(
        key: uniqueKey,
        indicator: indicator ?? this.indicator,
        decoration: decoration ?? this.decoration,
        leading: leading ?? this.leading,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        trailing: trailing ?? this.trailing,
        tileColor: tileColor ?? this.tileColor,
        alignment: alignment ?? this.alignment,
      );

  @override
  Widget build(BuildContext context) {
    var leadingChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (indicator != null && alignment == JListTileAlignment.beforeLeading)
          indicator!,
        if (leading != null) leading!,
        if (indicator != null && alignment == JListTileAlignment.afterLeading)
          indicator!,
      ],
    );
    var trailingChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (indicator != null && alignment == JListTileAlignment.beforeTrailing)
          indicator!,
        if (trailing != null) trailing!,
        if (indicator != null && alignment == JListTileAlignment.afterTrailing)
          indicator!,
      ],
    );
    var decoration2 = (decoration as BoxDecoration);
    return ListTile(
      tileColor: tileColor,
      shape: RoundedRectangleBorder(
          borderRadius: decoration2.borderRadius!,
          side: BorderSide(
              color: decoration2.border!.top.color,
              width: decoration2.border!.top.width)),
      leading: leadingChild,
      title: title,
      subtitle: subtitle,
      trailing: trailingChild,
    );
  }
}
