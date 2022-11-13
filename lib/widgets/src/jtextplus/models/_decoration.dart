part of '../_logic/decorator.dart';

/// DataModel to explain the unit of word in decoration system
class _Decoration extends Comparable<_Decoration> {
  _Decoration({
    required this.range,
    this.rule,
  });

  final TextRange range;
  final JTextStyle? rule;

  @override
  int compareTo(_Decoration other) {
    return range.start.compareTo(other.range.start);
  }
}
