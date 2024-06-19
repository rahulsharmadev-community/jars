part of '../regpatterns.dart';

class RegPattern {
  // ignore: unused_field
  final String _pattern, message;
  const RegPattern({
    required String pattern,
    String? message,
  })  : message = message ?? 'Invalid format',
        _pattern = pattern;

  bool hasMatch(String value, {multiLine = false}) {
    return RegExp(
      _pattern,
      multiLine: multiLine,
    ).hasMatch(value);
  }
}
