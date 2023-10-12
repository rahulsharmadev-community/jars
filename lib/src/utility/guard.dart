/// Function wrapping the body with try/catch and returns
/// default value if error was raised or return value is null
T? guard<T>(
  T Function() callback, {
  T? defaultValue,
  void Function(dynamic error)? onError,
}) {
  try {
    return callback() ?? defaultValue;
  } catch (err) {
    if (onError != null) onError(err);
    return defaultValue;
  }
}

/// Function asynchonically wrapping the body with try/catch and returns
/// default value if error was raised or return value is null
Future<T?> asyncGuard<T>(
  Future<T> Function() callback, {
  T? defaultValue,
  void Function(dynamic error)? onError,
}) async {
  try {
    return await callback() ?? defaultValue;
  } catch (err) {
    if (onError != null) onError(err);
    return defaultValue;
  }
}
