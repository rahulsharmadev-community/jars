import 'dart:async';

/// Duration utilities.
extension DurationExtensions on Duration {
  /// Utility to delay some callback (or code execution).
  ///
  /// Sample:
  /// ```
  /// void main() async {
  ///   final _delay = 3.seconds;
  ///   print('+ wait $_delay');
  ///   await _delay.delay();
  ///   print('- finish wait $_delay');
  ///   print('+ callback in 700ms');
  ///   await 0.7.seconds.delay(() {
  /// }
  ///```
  Future delay([FutureOr Function()? callback]) async =>
      Future.delayed(this, callback);

  hms({bool showFull = false}) =>
      '${inHours > 0 ? '${(inHours % 60).round()}:' : ''}'
              '${inMinutes > 0 ? '${(inMinutes % 60).round()}:' : ''}'
              '${(inSeconds % 60).round()}'
          .trim();
}
