// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:jars/utility.dart';

extension ContextExtensions on BuildContext {
  WindowSize get activeWindowSize =>
      WindowSize.evaluate(orientation: mediaQuery.orientation, width: width, height: height);

  /// The same of `MediaQuery.of(context).size.width * percentage * 0.01`
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  ///
  /// `dart heightOf() = heightOf(100);`
  double heightOf([double percentage = 100]) => height * percentage * 0.01;

  /// The same of ``MediaQuery.of(context).size.width * percentage * 0.01``
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  ///
  /// ```widthOf() = widthOf(100);```
  double widthOf([double percentage = 100]) => width * percentage * 0.01;

  /// Gives you the power to get a portion of the height.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the height
  ///
  /// [reducedBy] is a percentage value of how much of the height you want
  /// if you for example want 46% of the height, then you reduce it by 56%.
  double heightTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (height - ((height / 100) * reducedBy)) / dividedBy;
  }

  /// Gives you the power to get a portion of the width.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the width
  ///
  /// [reducedBy] is a percentage value of how much of the width you want
  /// if you for example want 46% of the width, then you reduce it by 56%.
  double widthTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (width - ((width / 100) * reducedBy)) / dividedBy;
  }

  /// Divide the height proportionally by the given value
  double ratio({
    double dividedBy = 1,
    double reducedByW = 0.0,
    double reducedByH = 0.0,
  }) {
    return heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
        widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);
  }

  /// similar to [Theme.of(context).padding]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// similar to [Theme.of(context).padding]
  ThemeData get theme => Theme.of(this);

  /// Check if dark mode theme is enable
  bool get isDarkMode => (theme.brightness == Brightness.dark);

  /// give access to Theme.of(context).iconTheme.color
  Color? get iconColor => theme.iconTheme.color;

  /// similar to [Theme.of(context).padding]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// similar to [MediaQuery.of(context).padding]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// check if device is on landscape mode
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Platform's Height
  double get height => MediaQuery.of(this).size.height;

  /// Platform's Width
  double get width => MediaQuery.of(this).size.width;

  /// The aspect ratio of this size.
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  /// Platform's Pixel Ratio
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;
}
