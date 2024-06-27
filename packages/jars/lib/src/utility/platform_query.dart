// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  windows;

  static bool get isWeb => current == Platform.web;
  static bool get isMacOS => current == Platform.macOS;
  static bool get isWindows => current == Platform.windows;
  static bool get isLinux => current == Platform.linux;
  static bool get isAndroid => current == Platform.android;
  static bool get isIOS => current == Platform.iOS;
  static bool get isFuchsia => current == Platform.fuchsia;
  static bool get isDesktop {
    Platform active = current;
    return active == Platform.windows || active == Platform.linux || active == Platform.macOS;
  }

  static bool get isMobileorTablet {
    Platform active = current;
    return active == Platform.iOS || active == Platform.android;
  }

  static Platform get current {
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

  void executeFor({
    VoidCallback? web,
    VoidCallback? macOS,
    VoidCallback? windows,
    VoidCallback? linux,
    VoidCallback? android,
    VoidCallback? iOS,
    VoidCallback? fuchsia,
    VoidCallback? others,
    VoidCallback? mobile,
    VoidCallback? desktop,
  }) {
    if (Platform.isAndroid && android != null) return android();
    if (Platform.isIOS && iOS != null) return iOS();
    if (Platform.isMobileorTablet && mobile != null) return mobile();
    if (Platform.isLinux && linux != null) return linux();
    if (Platform.isWindows && windows != null) return windows();
    if (Platform.isMacOS && macOS != null) return macOS();
    if (Platform.isDesktop && desktop != null) return desktop();
    if (Platform.isWeb && web != null) return web();
    if (Platform.isFuchsia && fuchsia != null) return fuchsia();
  }
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
///
/// Enum representing different window sizes with their respective breakpoints.
enum WindowSize {
  /// Compact window size with a breakpoint of 600 pixels.
  /// for Phone in portrait
  COMPACT(600),

  /// Medium window size with a breakpoint of 840 pixels.
  /// for Tablet in portrait Foldable in portrait (unfolded)
  MEDIUM(840),

  /// Expanded window size with a breakpoint of 1200 pixels.
  /// Phone in landscape Tablet in landscape Foldable in landscape (unfolded) Desktop
  EXPANDED(1200),

  /// Large window size with a breakpoint of 1600 pixels.
  /// Desktop
  LARGE(1600),

  /// Extra large window size with no upper limit.
  /// Desktop Ultra-wide
  EXTRA_LARGE(double.infinity);

  /// The breakpoint value for the window size.
  final double breakpoint;

  /// Creates a [WindowSize] with the given breakpoint.
  const WindowSize(this.breakpoint);

  static WindowSize evaluate({
    required Orientation orientation,
    required double width,
    required double height,
  }) {
    double mainDimension = orientation == Orientation.portrait ? width : height;

    if (mainDimension < WindowSize.COMPACT.breakpoint) {
      return WindowSize.COMPACT;
    } else if (mainDimension < WindowSize.MEDIUM.breakpoint) {
      return WindowSize.MEDIUM;
    } else if (mainDimension < WindowSize.EXPANDED.breakpoint) {
      return WindowSize.EXPANDED;
    } else if (mainDimension < WindowSize.LARGE.breakpoint) {
      return WindowSize.LARGE;
    } else {
      return WindowSize.EXTRA_LARGE;
    }
  }
}
