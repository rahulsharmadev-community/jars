import 'package:flutter/material.dart';

class AnimatedJSwitcher extends StatelessWidget {
  /// Controls which child is shown. `true` shows [firstChild].
  final bool value;

  /// The widget to show when [value] is `true`.
  final Widget firstChild;

  /// The widget to show when [value] is `false`.
  final Widget? secondChild;

  /// The duration for the crossfade animation. Defaults to 250 milliseconds.
  final Duration? duration;

  /// The reverse duration for the crossfade animation. Defaults to 250 milliseconds.
  final Duration? reverseDuration;

  /// The animation curve. Defaults to [Curves.easeInOut].
  final Curve curve;

  /// The reverse animation curve. Defaults to [Curves.easeInOut].
  final Curve reverseCurve;

  const AnimatedJSwitcher(
    this.value, {
    super.key,
    required this.firstChild,
    this.secondChild,
    this.duration,
    this.reverseDuration,
    this.curve = Curves.easeInOut,
    this.reverseCurve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    final duration = this.duration ?? const Duration(milliseconds: 250);
    return AnimatedCrossFade(
      crossFadeState: value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: duration,
      reverseDuration: reverseDuration ?? duration,
      firstChild: firstChild,
      secondChild: secondChild ?? const SizedBox.shrink(),
      firstCurve: curve,
      secondCurve: reverseCurve,
    );
  }
}
