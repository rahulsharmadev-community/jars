import 'package:flutter/widgets.dart';
import 'align_jar.dart';

extension WidgetExtensions on Widget {
  AlignJar get align => AlignJar(this);

  SizedBox boxHeight(double value) => SizedBox(height: value, child: this);
  SizedBox boxWidth(double value) => SizedBox(width: value, child: this);

  SizedBox boxSize(double width, double height) {
    return SizedBox(width: width, height: height, child: this);
  }

  PreferredSize preferredSize(double width, double height) {
    return PreferredSize(preferredSize: Size(width, height), child: this);
  }

  SizedBox expandBox() => SizedBox.expand(child: this);

  SizedBox squareBox([double? dimension]) => SizedBox.square(dimension: dimension, child: this);

  ClipRRect curvedBox([double radius = 8]) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), clipBehavior: Clip.hardEdge, child: this);

  ClipRRect circleBox() =>
      ClipRRect(borderRadius: BorderRadius.circular(1000), clipBehavior: Clip.hardEdge, child: this);

  SizedBox fittedBox([double? dimension]) =>
      SizedBox.square(dimension: dimension, child: FittedBox(child: this));

  Flexible tightFit([int flex = 1]) => Flexible(fit: FlexFit.tight, flex: flex, child: this);

  Flexible looseFit([int flex = 1]) => Flexible(fit: FlexFit.loose, flex: flex, child: this);

  /// Creates a widget that makes its child partially transparent.
  ///
  /// The [opacity] argument must not be null and must be between 0.0 and 1.0
  /// (inclusive).
  Opacity opacity(
    double opacity, {
    Key? key,
    bool alwaysIncludeSemantics = false,
    Widget? child,
  }) =>
      Opacity(key: key, opacity: opacity, alwaysIncludeSemantics: alwaysIncludeSemantics, child: this);

  Padding paddingAll(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Padding paddingHorizontal([double value = 0.0]) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);

  Padding paddingVertical([double value = 0.0]) =>
      Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);

  Padding paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(padding: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom), child: this);

  Padding paddingLTRB([
   double left = 0.0,
   double top = 0.0,
   double right = 0.0,
   double bottom = 0.0,
  ]) =>
      Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);

  /// Allows you to insert widgets inside a CustomScrollView
  SliverToBoxAdapter get wSliverBox => SliverToBoxAdapter(child: this);
}
