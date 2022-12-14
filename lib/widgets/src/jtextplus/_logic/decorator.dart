import 'package:flutter/material.dart' hide Decoration;
import 'package:jars/core/library_core.dart';
import '../models/jtextstyle.dart';
part '../models/_decoration.dart';

/// Hold functions to decorate tagged text
///
/// Return the list of [_Decoration] in [getDecorations]
class Decorator {
  final List<JTextStyle> rules;

  Decorator({required this.rules});

  List<_Decoration> _getSourceDecorations(
    List<RegExpMatch> tags,
    String copiedText,
  ) {
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
  List<_Decoration> getDecorations(
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

    return _getSourceDecorations(tags, copiedText);
  }
}
