part of 'jmarquee.dart';

/// A curve that represents the integral of another curve.
///
/// The constructor takes an other curve and calculates the integral. The
/// values of this curve are then being normalized onto the interval from 0 to
/// 1, but the integration value can always be obtained using the [interval]
/// property.
class _IntegralCurve extends Curve {
  /// Delta for integrating.
  static double delta = 0.01;

  const _IntegralCurve._(this.original, this.integral, this._values);

  /// The original curve that was integrated.
  final Curve original;

  /// The integral value.
  final double integral;

  /// Cached cumulative values of the integral.
  final Map<double, double> _values;

  /// The constructor that takes the [original] curve.
  factory _IntegralCurve(Curve original) {
    double integral = 0.0;
    final values = <double, double>{};

    for (double t = 0.0; t <= 1.0; t += delta) {
      integral += original.transform(t) * delta;
      values[t] = integral;
    }
    values[1.0] = integral;

    // Normalize.
    for (final double t in values.keys) {
      values[t] = values[t]! / integral;
    }

    return _IntegralCurve._(original, integral, values);
  }

  /// Transforms a value to the normalized integrated value of the [original]
  /// curve.
  @override
  double transform(double t) {
    if (t < 0) return 0.0;
    for (final key in _values.keys) {
      if (key > t) return _values[key]!;
    }
    return 1.0;
  }
}
