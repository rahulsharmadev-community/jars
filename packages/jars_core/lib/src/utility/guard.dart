import 'dart:async';

T? guard<T>(T Function() callback, {T? def, bool reThrow = false, void Function(dynamic error)? onError}) =>
    callback.guard(def: def, reThrow: reThrow, onError: onError);

Future<T?> asyncGuard<T>(Future<T> Function() callback,
        {T? def, bool reThrow = false, void Function(dynamic error)? onError}) =>
    callback.asyncGuard(def: def, reThrow: reThrow, onError: onError);

bool guardSafe(void Function() callback, {bool reThrow = false, void Function(dynamic error)? onError}) =>
    callback.guardSafe(reThrow: reThrow, onError: onError);

Future<bool> asyncGuardSafe(Future Function() callback,
        {bool reThrow = false, void Function(dynamic error)? onError}) =>
    callback.asyncGuardSafe(reThrow: reThrow, onError: onError);

extension GuardFunctionExt<T> on T Function() {
  /// Returns true if the function succeeds, or false if an exception occurs.
  /// Optionally, the error can be logged using [onError] or rethrown if [reThrow] is true.
  bool guardSafe({
    bool reThrow = false,
    void Function(dynamic error)? onError,
  }) {
    try {
      this();
      return true;
    } catch (error) {
      if (onError != null) onError(error);
      if (reThrow) rethrow;
      return false;
    }
  }

  /// Function wrapping the body with try/catch and returns
  /// default value if error was raised or return value is null.
  T? guard({
    T? def,
    bool reThrow = false,
    void Function(dynamic error)? onError,
  }) {
    try {
      return this() ?? def;
    } catch (err) {
      if (onError != null) onError(err);
      if (reThrow) rethrow;
      return def;
    }
  }
}

extension AsyncGuardFunctionExt<T> on Future<T> Function() {
  /// Function asynchronously wrapping the body with try/catch and returns
  /// default value if error was raised or return value is null.
  Future<T?> asyncGuard({
    T? def,
    bool reThrow = false,
    void Function(dynamic error)? onError,
  }) async {
    try {
      return await this() ?? def;
    } catch (err) {
      if (onError != null) onError(err);
      if (reThrow) rethrow;
      return def;
    }
  }

  /// Returns true if the function succeeds, or false if an exception occurs.
  /// Optionally, the error can be logged using [onError] or rethrown if [reThrow] is true.
  Future<bool> asyncGuardSafe({
    bool reThrow = false,
    void Function(dynamic error)? onError,
  }) async {
    try {
      await this();
      return true;
    } catch (error) {
      if (onError != null) onError(error);
      if (reThrow) rethrow;
      return false;
    }
  }
}
