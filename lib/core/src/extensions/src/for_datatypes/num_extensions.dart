import 'dart:async';

extension NnmExtensions on num {
  bool isLowerThan(num b) => this < b;

  bool isGreaterThan(num b) => this > b;

  bool isEqual(num b) => this == b;

  /// Sample:
  /// ```
  /// void main(){
  ///   print(readableString(451251365));
  /// }
  /// ```
  /// ----------
  /// 451,251,365
  /// ----------
  String readableString(double number) {
    RegExp _readable = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) _mathFunc = (Match match) => '${match[1]},';
    return '$number'
        .split('.')
        .map((e) => e.replaceAllMapped(_readable, _mathFunc))
        .join('.');
  }

  /// Sample:
  /// ```
  /// void main() async {
  ///   print('+ wait for 2 seconds');
  ///   await 2.delay();
  ///   print('- 2 seconds completed');
  ///   print('+ callback in 1.2sec');
  ///   1.delay(() => print('- 1.2sec callback called'));
  ///   print('currently running callback 1.2sec');
  /// }
  ///```
  Future delay([FutureOr Function()? callback]) async => Future.delayed(
        Duration(milliseconds: (this * 1000).round()),
        callback,
      );

  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  Duration get seconds => Duration(milliseconds: (this * 1000).round());

  Duration get minutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  Duration get hours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());
}
