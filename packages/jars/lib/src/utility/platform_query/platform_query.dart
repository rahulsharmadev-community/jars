import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
part 'platform_query_extensions.dart';

/// Type of Device
///
/// This can be android, ios, fuchsia, web, windows, mac, linux
enum Platform {
  web,

  /// Android: <https://www.android.com/>
  android,

  /// Fuchsia: <https://fuchsia.dev/fuchsia-src/concepts>
  fuchsia,

  /// iOS: <https://www.apple.com/ios/>
  iOS,

  /// Linux: <https://www.linux.org>
  linux,

  /// macOS: <https://www.apple.com/macos>
  macOS,

  /// Windows: <https://www.windows.com>
  windows,
}

/// ## [Window size](https://medium.com/@rahulsharmadev/responsive-design-theory-b8f18b257295)
/// Window size classes categorize the display area available to your app as compact,
/// medium, or expanded. Available width and height are classified separately,
/// so at any point in time, your app has two window size classes — one for width, one for height.
///
/// [Material Design](https://m3.material.io/foundations/adaptive-design/large-screens/overview#f42c09a8-0bd5-4cca-8960-5471e515f1da)
///
/// ![](https://miro.medium.com/max/500/0*oPd79x6WOCdQAhvD.png)
/// ![](https://miro.medium.com/max/500/0*jP_sMyX7M4e_O97J.png)
///
/// ![](https://miro.medium.com/max/720/1*oM4L8A6gvwOCWgd-gmq8gg.png)
enum WindowSize { compact, medium, expanded }

class PlatformQuery with WidgetsBindingObserver {
  PlatformQuery._();

  static bool get isWeb => activePlatform == Platform.web;
  static bool get isMacOS => activePlatform == Platform.macOS;
  static bool get isWindows => activePlatform == Platform.windows;
  static bool get isLinux => activePlatform == Platform.linux;
  static bool get isAndroid => activePlatform == Platform.android;
  static bool get isIOS => activePlatform == Platform.iOS;
  static bool get isFuchsia => activePlatform == Platform.fuchsia;
  static bool get isDesktop {
    Platform active = activePlatform;
    return active == Platform.windows || active == Platform.linux || active == Platform.macOS;
  }

  static bool get isMobileorTablet {
    Platform active = activePlatform;
    return active == Platform.iOS || active == Platform.android;
  }

  static Platform get activePlatform {
    if (kIsWeb) return Platform.web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return Platform.android;

      case TargetPlatform.iOS:
        return Platform.iOS;

      case TargetPlatform.windows:
        return Platform.windows;

      case TargetPlatform.macOS:
        return Platform.macOS;

      case TargetPlatform.linux:
        return Platform.linux;

      default:
        return Platform.fuchsia;
    }
  }

  /// Device's Orientation
  static Orientation get orientation => mediaQueryData.orientation;

  /// Platform's Height
  static double get height => mediaQueryData.size.height;

  /// Platform's Width
  static double get width => mediaQueryData.size.width;

  /// The aspect ratio of this size.
  static double get aspectRatio => mediaQueryData.size.aspectRatio;

  /// Platform's Pixel Ratio
  static double get pixelRatio => mediaQueryData.devicePixelRatio;
  static WindowSize get activeWindowSize {
    double maxMobileWidth = 599;
    double maxTabletWidth = 839;
    if ((orientation == Orientation.portrait && width <= maxMobileWidth) ||
        (orientation == Orientation.landscape && height <= maxMobileWidth)) {
      return WindowSize.compact;
    } else if ((orientation == Orientation.portrait && width <= maxTabletWidth) ||
        (orientation == Orientation.landscape && height <= maxTabletWidth)) {
      return WindowSize.medium;
    } else {
      return WindowSize.expanded;
    }
  }

  static MediaQueryData get mediaQueryData =>
      MediaQueryData.fromView(WidgetsBinding.instance.renderViews.first.flutterView);

  static T returnSmartly<T>({required mobile, required tablet, required desktop}) {
    assert(
        mobile.runtimeType == tablet.runtimeType &&
            tablet.runtimeType == desktop.runtimeType &&
            desktop.runtimeType == mobile.runtimeType,
        'mobile, tablet & desktop should be same data type');
    switch (PlatformQuery.activeWindowSize) {
      case WindowSize.compact:
        return mobile;
      case WindowSize.medium:
        return tablet;
      default:
        return desktop;
    }
  }
}

class PlatformQueryBuilder extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  /// **Recommendation to use it LESS**
  /// ```dart
  /// class PlatformQueryBuilder extends StatelessWidget {
  ///   final Widget Function(BuildContext) builder;

  ///  const PlatformQueryBuilder({super.key, required this.builder});
  ///  @override
  ///  Widget build(BuildContext context) {
  ///    MediaQuery.maybeOf(context);
  ///     return builder(context);
  ///  }
  /// }
  /// ```
  ///
  /// How to use?
  /// ```dart
  /// PlatformQueryBuilder(
  ///     builder: (ctx) {
  ///       String string =
  ///           'Hello <${TextStyle(color: Colors.red, fontSize: 20.sp, backgroundColor: Colors.orange).toTextPlusStyle} = "World 😂"> I am hear.';
  ///       return TextPlus(string);
  ///     },
  ///   ),
  /// );
  /// ```
  const PlatformQueryBuilder({super.key, required this.builder});
  @override
  Widget build(BuildContext context) {
    MediaQuery.maybeOf(context);
    return builder(context);
  }
}
