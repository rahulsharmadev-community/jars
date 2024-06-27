import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class AdaptiveLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext context)? compact;
  final Widget Function(BuildContext context)? medium;
  final Widget Function(BuildContext context)? expanded;
  final Widget Function(BuildContext context)? large;
  final Widget Function(BuildContext context)? extraLarge;
  const AdaptiveLayoutBuilder({
    super.key,
    this.compact,
    this.medium,
    this.expanded,
    this.large,
    this.extraLarge,
  });

  @override
  Widget build(BuildContext context) {
    var active = context.activeWindowSize;
    Widget result;
    if (extraLarge != null) {
      result = extraLarge!(context);
      if (active == WindowSize.EXTRA_LARGE) return result;
    } else if (large != null) {
      result = large!(context);
      if (active == WindowSize.LARGE) return result;
    } else if (expanded != null) {
      result = expanded!(context);
      if (active == WindowSize.EXPANDED) return result;
    } else if (medium != null) {
      result = medium!(context);
      if (active == WindowSize.MEDIUM) return result;
    } else if (compact != null) {
      result = compact!(context);
      if (active == WindowSize.COMPACT) return result;
    }
    return const Material(child: Text('No Layout Found'));
  }
}
