import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

extension ContextExtensions on BuildContext {
  /// The same of [MediaQuery.of(context).size]
  Size get screenSize => MediaQuery.of(this).size;

  /// The same of `MediaQuery.of(context).size.width * percentage * 0.01`
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  ///
  /// `dart heightOf() = heightOf(100);`
  double heightOf([double percentage = 100]) => screenSize.height * percentage * 0.01;

  /// The same of ``MediaQuery.of(context).size.width * percentage * 0.01``
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  ///
  /// ```widthOf() = widthOf(100);```
  double widthOf([double percentage = 100]) => screenSize.width * percentage * 0.01;

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
    return (screenSize.height - ((screenSize.height / 100) * reducedBy)) / dividedBy;
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
    return (screenSize.width - ((screenSize.width / 100) * reducedBy)) / dividedBy;
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

  Widget buildFor({
    Widget? web,
    Widget? macOS,
    Widget? windows,
    Widget? linux,
    Widget? android,
    Widget? iOS,
    Widget? fuchsia,
    Widget? others,
    Widget? mobile,
    Widget? desktop,
  }) {
    if (PlatformQuery.isAndroid && android != null) return android;
    if (PlatformQuery.isIOS && iOS != null) return iOS;
    if (PlatformQuery.isMobileorTablet && mobile != null) return mobile;
    if (PlatformQuery.isLinux && linux != null) return linux;
    if (PlatformQuery.isWindows && windows != null) return windows;
    if (PlatformQuery.isMacOS && macOS != null) return macOS;
    if (PlatformQuery.isDesktop && desktop != null) return desktop;
    if (PlatformQuery.isWeb && web != null) return web;
    if (PlatformQuery.isFuchsia && fuchsia != null) return fuchsia;

    // Default behavior if no platform-specific widget is provided
    return const Placeholder(
      child: Text('No Widget Define'),
    ); // or any other suitable default widget
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
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  /// similar to [MediaQuery.of(context).padding]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// similar to [MediaQuery.of(context).viewPadding]
  EdgeInsets get mediaQueryViewPadding => MediaQuery.of(this).viewPadding;

  /// similar to [MediaQuery.of(context).viewInsets]
  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;

  /// similar to [MediaQuery.of(context).orientation]
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// similar to [MediaQuery.of(this).devicePixelRatio]
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// similar to [MediaQuery.of(this).TextScaler]
  TextScaler  get textScaler => MediaQuery.of(this).textScaler;

  /// get the shortestSide from screen
  double get mediaQueryShortestSide => screenSize.shortestSide;
}
