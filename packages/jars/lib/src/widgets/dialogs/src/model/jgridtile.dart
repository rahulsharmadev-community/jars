import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

enum IndicatorAlignment {
  topLeft(Alignment(-1.0, -1.0)),
  topCenter(Alignment(0.0, -1.0)),
  topRight(Alignment(1.0, -1.0)),
  centerLeft(Alignment(-1.0, 0.0)),
  center(Alignment(0.0, 0.0)),
  centerRight(Alignment(1.0, 0.0)),
  bottomLeft(Alignment(-1.0, 1.0)),
  bottomCenter(Alignment(0.0, 1.0)),
  bottomRight(Alignment(1.0, 1.0)),
  beforHeader(Alignment(0.0, 0.0)),
  afterHeader(Alignment(0.0, 0.0)),
  beforeFooter(Alignment(0.0, 0.0)),
  afterFooter(Alignment(0.0, 0.0));

  final Alignment alignment;
  const IndicatorAlignment(this.alignment);
}

class JGridTile extends StatelessWidget {
  final String uniqueKey;
  final Widget? header;
  final Widget? footer;
  final Widget child;
  final Widget? indicator;
  final Decoration? decoration;
  final IndicatorAlignment alignment;

  JGridTile({
    required String key,
    this.header,
    this.footer,
    this.indicator,
    required this.child,
    this.decoration,
    this.alignment = IndicatorAlignment.bottomCenter,
  })  : uniqueKey = key,
        super(key: Key(key));

  JGridTile copyWidth(
          {Widget? header,
          Widget? footer,
          Widget? child,
          Widget? indicator,
          Decoration? decoration,
          IndicatorAlignment? alignment}) =>
      JGridTile(
        key: uniqueKey,
        alignment: alignment ?? this.alignment,
        decoration: decoration ?? this.decoration,
        footer: footer ?? this.footer,
        header: header ?? this.header,
        indicator: indicator ?? this.indicator,
        child: child ?? this.child,
      );

  @override
  Widget build(BuildContext context) {
    Widget renderFooter() {
      if (indicator == null) {
        return footer!.align.bottomLeft();
      } else {
        return Row(
          children: [
            if (alignment == IndicatorAlignment.beforeFooter) indicator!,
            footer!,
            if (alignment == IndicatorAlignment.afterFooter) indicator!,
          ],
        ).align.bottomLeft();
      }
    }

    Widget renderHeader() {
      if (indicator == null) {
        return header!.align.topLeft();
      } else {
        return Row(
          children: [
            if (alignment == IndicatorAlignment.beforHeader) indicator!,
            header!,
            if (alignment == IndicatorAlignment.afterHeader) indicator!,
          ],
        ).align.topLeft();
      }
    }

    if (header == null && footer == null && indicator == null) {
      return child;
    }
    return DecoratedBox(
      decoration: decoration ?? const BoxDecoration(),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: child,
          ),
          if (footer != null) renderFooter(),
          if (header != null) renderHeader(),
          if (indicator != null && alignment.index <= 8)
            Align(
              alignment: alignment.alignment,
              child: indicator,
            )
        ],
      ),
    );
  }
}
