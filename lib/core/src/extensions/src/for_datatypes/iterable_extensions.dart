import 'dart:math' as math;

extension IterableExtensions<T> on Iterable<T> {
  Iterable<TRes> mapMany<TRes>(
      Iterable<TRes>? Function(T item) selector) sync* {
    for (var item in this) {
      final res = selector(item);
      if (res != null) yield* res;
    }
  }

  /// Returns true if every element in [other] also exists in [this].
  ///
  /// Example:
  /// ```
  /// [1, 2, 3].containsAll([1, 1, 1, 2]); // true
  /// [1, 2, 3].containsAll([1, 1, 1, 2], collapseDuplicates: false); // false
  /// [1, 1, 2, 3].containsAll([1, 1, 2], collapseDuplicates: false); // true
  /// ```
  bool containsAll(Iterable<T> other, {bool collapseDuplicates = true}) {
    if (other.isEmpty) return true;
    if (collapseDuplicates) {
      return Set<T>.from(this).containsAll(Set<T>.from(other));
    }

    final thisElementCounts = _elementCountsIn<T>(this);
    final otherElementCounts = _elementCountsIn<T>(other);

    for (final element in otherElementCounts.keys) {
      final countInThis = thisElementCounts[element] ?? 0;
      final countInOther = otherElementCounts[element] ?? 0;
      if (countInThis < countInOther) {
        return false;
      }
    }
    return true;
  }

  /// Returns a random element of [this], or [null] if [this] is empty.
  ///
  /// If [seed] is provided, will be used as the random seed for determining
  /// which element to select. (See [math.Random].)
  T? getRandom({int? seed}) => this.isEmpty
      ? null
      : this.elementAt(math.Random(seed).nextInt(this.length));

  Map<E, int> _elementCountsIn<E>(Iterable<E> iterable) {
    final counts = <E, int>{};
    for (final element in iterable) {
      final currentCount = counts[element] ?? 0;
      counts[element] = currentCount + 1;
    }
    return counts;
  }
}

/// Utility extension methods for [Iterable]s containing [num]s.
extension NumIterableBasics<E extends num> on Iterable<E> {
  /// Returns the greatest number in [this], or [null] if [this] is empty.
  ///
  /// Example:
  /// ```dart
  ///     [-47, 10, 2].max((a, b) =>
  ///     a.toString().length.compareTo(b.toString().length)).value; // -47
  /// ```
  E? max([Comparator<E>? compare]) => this.isEmpty
      ? null
      : this.reduce(
          compare == null ? math.max : _generateCustomMaxFunction<E>(compare));

  /// Returns the least number in [this], or [null] if [this] is empty.
  ///
  /// Example:
  /// ```dart
  /// [-100, -200, 5].min((a, b) =>
  ///     a.toString().length.compareTo(b.toString().length)).value; // 5
  /// ```
  E? min([Comparator<E>? compare]) => this.isEmpty
      ? null
      : this.reduce(
          compare == null ? math.min : _generateCustomMinFunction<E>(compare));

  /// Returns the sum of all the values in this iterable.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].sum(); // 6.
  /// [2, 3, 4].sum((i) => i * 0.5); // 4.5.
  /// [].sum() // 0.
  /// ```
  num sum([num Function(E)? addend]) {
    if (this.isEmpty) return 0;
    return addend == null
        ? this.reduce((a, b) => (a + b) as E)
        : this.fold(0, (prev, element) => prev + addend(element));
  }

  /// Returns the average of all the values in this iterable.
  ///
  /// Example:
  /// ```dart
  /// [2, 2, 4, 8].average(); // 4.
  /// [2, 2, 4, 8].average((i) => i + 1); // 5.
  /// [].average() // null.
  /// ```
  num? average([num Function(E)? value]) {
    if (this.isEmpty) return null;

    return this.sum(value) / this.length;
  }
}

T Function(T, T) _generateCustomMaxFunction<T>(Comparator<T> compare) {
  T max(T a, T b) {
    if (compare(a, b) >= 0) return a;
    return b;
  }

  return max;
}

T Function(T, T) _generateCustomMinFunction<T>(Comparator<T> compare) {
  T min(T a, T b) {
    if (compare(a, b) <= 0) return a;
    return b;
  }

  return min;
}
