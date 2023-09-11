part of '../../jtextplus.dart';

/// Hold functions to decorate tagged text
///
/// Return the list of [_Decoration] in [getDecorations]
class _JTextPlusFunction {
  static TextSpan getChildTextSpan({
    required String source,
    required TextStyle? defaultStyle,
    required List<JTextStyle> jStyles,
  }) {
    final decorations = getDecorations(source, jStyles);
    if (decorations.isEmpty) {
      return TextSpan(text: source, style: defaultStyle);
    } else {
      decorations.sort();
      final span = decorations
          .map((item) {
            String text = item.range.textInside(source);
            if (item.rule?.transformMatch != null) {
              text = item.rule!.transformMatch!(text);
            }
            return TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: item.rule,
                  recognizer: item.rule?.recognizer != null
                      ? item.rule?.recognizer!(text)
                      : null,
                ),
              ],
            );
          })
          .whereType<TextSpan>()
          .toList();

      return TextSpan(children: span, style: defaultStyle);
    }
  }

  static List<_Decoration> _getSourceDecorations(
      List<RegExpMatch> tags, String copiedText, List<JTextStyle> rules) {
    TextRange? previousItem;
    final List<_Decoration> result = [];
    for (final tag in tags) {
      ///Add untagged content
      if (previousItem == null) {
        if (tag.start > 0) {
          result.add(
            _Decoration(
              range: TextRange(start: 0, end: tag.start),
            ),
          );
        }
      } else {
        result.add(
          _Decoration(
            range: TextRange(
              start: previousItem.end,
              end: tag.start,
            ),
          ),
        );
      }

      result.add(
        _Decoration(
          range: TextRange(start: tag.start, end: tag.end),
          rule: rules.firstWhereOrNull(
            (element) =>
                tag.pattern.toString().contains(element.regExp.pattern),
          ),
        ),
      );

      previousItem = TextRange(
        start: tag.start,
        end: tag.end,
      );
    }

    ///Add remaining untagged content
    if (result.last.range.end < copiedText.length) {
      result.add(
        _Decoration(
          range: TextRange(
            start: result.last.range.end,
            end: copiedText.length,
          ),
        ),
      );
    }
    return result;
  }

  /// Return the list of decorations with tagged and untagged text
  static List<_Decoration> getDecorations(
    String copiedText,
    List<JTextStyle> rules,
  ) {
    final List<RegExpMatch> tagsTemp = [];
    for (final rule in rules) {
      final regExp = rule.regExp;
      final localTags = regExp.allMatches(copiedText);
      tagsTemp.addAll(localTags);
    }

    final List<RegExpMatch> tags = [];
    for (final tag in tagsTemp) {
      if (tags.any((e) => tag.start <= e.start && tag.end >= e.end)) {
        tags.removeWhere((e) => tag.start <= e.start && tag.end >= e.end);
        tags.add(tag);
      } else if (!tags.any((e) => tag.start >= e.start && tag.end <= e.end)) {
        tags.add(tag);
      }
    }

    if (tags.isEmpty) {
      return [];
    }

    tags.sort((a, b) {
      return a.start < b.start ? -1 : 1;
    });

    final Set<RegExpMatch> toRemoveTags = {};
    for (final tagA in tags) {
      for (final tagB in tags) {
        if (tagA.start > tagB.start && tagA.end < tagB.end) {
          toRemoveTags.add(tagA);
        }
      }
    }
    for (final tag in toRemoveTags) {
      tags.remove(tag);
    }

    return _getSourceDecorations(tags, copiedText, rules);
  }
}

/// DataModel to explain the unit of word in decoration system
class _Decoration {
  _Decoration({
    required this.range,
    this.rule,
  });

  final TextRange range;
  final JTextStyle? rule;

  int compareTo(_Decoration other) {
    return range.start.compareTo(other.range.start);
  }
}
