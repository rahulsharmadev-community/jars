extension GuardFunctionExt on Function {
  /// Executes the function and guards against exceptions.
  ///
  /// Returns true if the function succeeds, or false if an exception occurs.
  /// Optionally, the error can be logged using [onError] or rethrown if [rethrow] is true.
  ///
  /// - [reThrow]: Whether to rethrow the caught exception.
  /// - [onError]: An optional callback to handle the error.
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
  /// default value if error was raised or return value is null
  T guard<T>({
    required T def,
    bool reThrow = false,
    void Function(dynamic error)? onError,
  }) {
    try {
      return this();
    } catch (error) {
      if (onError != null) onError(error);
      if (reThrow) rethrow;
      return def;
    }
  }

  /// Function asynchonically wrapping the body with try/catch and returns
  /// default value if error was raised or return value is null
  ///```
  Future<T> asyncGuard<T>({
    required T def,
    bool reThrow = false,
    void Function(dynamic error)? onError,
  }) async {
    try {
      return await this() ?? def;
    } catch (error) {
      if (onError != null) onError(error);
      if (reThrow) rethrow;
      return def;
    }
  }
}
