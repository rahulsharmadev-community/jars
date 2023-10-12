extension MapExtensions on Map<String, dynamic> {
  Map<String, dynamic> difference(Map<String, dynamic> oldValue,
      [bool pure = true]) {
    Map<String, dynamic> map = {};
    forEach((key, value) {
      if (oldValue.containsKey(key)) {
        var diff = _recursiveDifference(value, oldValue[key], pure);
        if (diff != null) map[key] = diff;
      } else {
        map[key] = value;
      }
    });
    return map;
  }

  dynamic _recursiveDifference(dynamic newValue, dynamic oldValue, bool pure) {
    if (newValue is Map && oldValue is Map) {
      var diff = {};
      newValue.forEach((key, value) {
        var nestedDiff = _recursiveDifference(value, oldValue[key], pure);
        if (nestedDiff != null) {
          diff[key] = nestedDiff;
        }
      });
      return diff.isNotEmpty ? diff : null;
    } else if (newValue is List && oldValue is List) {
      if (newValue.isEmpty && oldValue.isEmpty) return null;

      if (!pure) {
        if (newValue == oldValue) return null;
        return newValue;
      }
      Set<dynamic> newls = Set<dynamic>.from(newValue);
      Set<dynamic> oldls = Set<dynamic>.from(oldValue);
      return newls.difference(oldls).toList();
    } else if (newValue != oldValue) {
      return newValue;
    }
    return null;
  }
}
