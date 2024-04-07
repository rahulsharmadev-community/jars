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
///
///Example:
///```
///  Future<void> main() async {
///   int result = await asyncGuard(() async {
///     // Some asynchronous operation that may throw an error
///     return 42;
///   }, defaultValue: -1, onError: (error) {
///     print('An error occurred: $error');
///   });
///   print('Result: $result'); // Output: Result: 42
/// }
///```
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

/// Checks if the provided [property] is not null. If it is not null, applies the [callback]
/// function to the property and returns the result. Otherwise, returns null.
///
///```
///   // Using ifNotNull function
///   int? length = ifNotNull(name, (value) => value.length);
///
///   // Equivalent alternative using the ternary operator
///   int? altLength = name != null ? name.length : null;
/// ```
///
R? ifNotNull<T, R>(T? property, R Function(T value) callback) {
  return property != null ? callback(property) : null;
}
