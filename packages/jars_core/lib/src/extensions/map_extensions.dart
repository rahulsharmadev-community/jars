import 'package:collection/collection.dart';

extension MapExtensions<K, V> on Map<K, V> {
  /// Compare two elements for being equal.
  bool equals(Map<K, V> other) => DeepCollectionEquality().equals(this, other);

  void removeAll(List<K> keys) => keys.forEach((key) => remove(key));

  /// Returns a new map containing all key-value pairs in this map
  /// except those that are present in the [other] map.
  ///
  /// Optionally, you can specify whether to compare only keys ([compareOnlyKey]).
  Map<K, V> subtract(Map<K, V> other, {bool compareOnlyKey = false}) {
    if (other.isEmpty) return this;
    var map = {...this};
    final deep = DeepCollectionEquality();
    other.forEach((key, value) {
      if (this[key] is Map && other[key] is Map) {
        var subtract = (this[key] as Map).subtract(other[key] as Map);
        subtract.isEmpty ? map.remove(key) : map[key] = subtract as V;
      } else if (compareOnlyKey || deep.equals(map[key], value)) {
        map.remove(key);
      }
    });
    return map;
  }

  /// Returns a new map containing all key-value pairs from this map
  /// and the [other] map.
  Map<K, V> union(Map<K, V> other) => {...other, ...this};

  /// Returns a new map containing key-value pairs that are present
  /// in both this map and the [other] map.
  ///
  /// Optionally, you can specify whether to compare only keys ([compareOnlyKey]).
  Map<K, V> intersection(Map<K, V> other, {bool compareOnlyKey = false}) {
    if (isEmpty || other.isEmpty) return const {};
    final deep = DeepCollectionEquality();
    var smks = (length < other.length ? keys : other.keys);
    return {
      for (var key in smks)
        if (this[key] is Map && other[key] is Map) ...{
          key: (this[key] as Map).intersection(other[key] as Map) as V
        } else if ((compareOnlyKey && containsKey(key)) || deep.equals(this[key], other[key])) ...{
          key: this[key] as V
        }
    };
  }

  /// Returns a new map containing key-value pairs that are present
  /// either in this map or the [other] map, but not in both.
  Map<K, V> symmetricDifference(Map<K, V> other) => union(other).subtract(intersection(other));
}
