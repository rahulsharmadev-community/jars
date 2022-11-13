import 'package:flutter/widgets.dart';
import 'platform_query/platform_query.dart';

class JDefault {
  const JDefault._();

  static EdgeInsets edgeInsetsLTRB(
      bool left, bool top, bool right, bool bottom) {
    double value =
        PlatformQuery.returnSmartly(mobile: 8, tablet: 12, desktop: 32);
    return EdgeInsets.fromLTRB(left ? value : 0, top ? value : 0,
        right ? value : 0, bottom ? value : 0);
  }
}
