extension SetExt on Set? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension IterableExt on Iterable? {
  bool get isNull => this == null;
  bool get isNotNull => !isNull;
  bool get isNullorEmpty => this == null ? true : this!.isEmpty;
  bool get isNotNullorEmpty => !isNullorEmpty;
}

extension MapExt on Map? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension StringExt on String? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension NumExt on num? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension ObjectExt on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension DynamicExtensions on dynamic {
  @Deprecated('isNull is deprecated and cannot be used, use "==" operator')
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}
