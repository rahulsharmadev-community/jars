import 'dart:math';

extension DoubleExtensions on double {
  ///  ```
  /// void main() {
  ///   print(23.455.toPrecision(1)); // Expected result: 23.5
  /// }
  /// ```
  double toPrecision(int fractionDigits) {
    var mod = pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}
