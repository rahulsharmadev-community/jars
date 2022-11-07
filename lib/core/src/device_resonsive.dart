import 'package:flutter/widgets.dart';
import 'platform_query/platform_query.dart';

class JDefault {
  const JDefault._();

  static EdgeInsets edgeInsetsLTRB(
      bool left, bool top, bool right, bool bottom) {
    double value = valueByDevice(mobile: 8, tablet: 12, desktop: 32);
    return EdgeInsets.fromLTRB(left ? value : 0, top ? value : 0,
        right ? value : 0, bottom ? value : 0);
  }

  static dynamic valueByDevice(
      {required dynamic mobile,
      required dynamic tablet,
      required dynamic desktop}) {
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
