class RegPattern {
  final String string;
  const RegPattern(this.string);

  static bool regMatch(String value, RegPattern pattern) =>
      RegExp(pattern.string).hasMatch(value);
}
