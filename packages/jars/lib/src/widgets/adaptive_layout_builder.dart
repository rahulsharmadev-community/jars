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
    return LayoutBuilder(
      builder: (context, constraints) {
        var active = WindowSize.evaluate(
          orientation: context.mediaQuery.orientation,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        );
        if (extraLarge != null && active == WindowSize.EXTRA_LARGE) {
          return extraLarge!(context);
        } else if (large != null && active == WindowSize.LARGE) {
          return large!(context);
        } else if (expanded != null && active == WindowSize.EXPANDED) {
          return expanded!(context);
        } else if (medium != null && active == WindowSize.MEDIUM) {
          return medium!(context);
        } else if (compact != null && active == WindowSize.COMPACT) {
          return compact!(context);
        }
        return const Material(child: Text('No Layout Found'));
      },
    );
  }
}
