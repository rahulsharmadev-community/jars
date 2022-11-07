import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  SizedBox wSized([double? width, double? height]) =>
      SizedBox(key: key, width: width, height: height, child: this);

  wExpanded({
    Key? key,
    int flex = 1,
  }) =>
      Expanded(key: key, flex: flex, child: this);

  /// Creates a widget that makes its child partially transparent.
  ///
  /// The [opacity] argument must not be null and must be between 0.0 and 1.0
  /// (inclusive).
  Opacity wOpacity(
    double opacity, {
    Key? key,
    bool alwaysIncludeSemantics = false,
    Widget? child,
  }) =>
      Opacity(
          key: key,
          opacity: opacity,
          alwaysIncludeSemantics: alwaysIncludeSemantics,
          child: this);

  /// add Padding Property to widget
  Padding wPaddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  ///  add Padding Property to widget
  Padding wPaddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  ///  add Padding Property to widget
  Padding wPaddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Padding get wPaddingZero => Padding(padding: EdgeInsets.zero, child: this);

  /// Add margin property to widget
  Container wMarginAll(double margin) =>
      Container(margin: EdgeInsets.all(margin), child: this);

  Container wMarginSymmetric(
          {double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
          margin:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Container wMarginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(
          margin: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Container get wMarginZero => Container(margin: EdgeInsets.zero, child: this);

  /// Allows you to insert widgets inside a CustomScrollView

  SliverToBoxAdapter get wSliverBox => SliverToBoxAdapter(child: this);
}
