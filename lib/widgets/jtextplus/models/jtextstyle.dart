import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class JTextStyle extends TextStyle {
  final bool caseSensitive;
  final String tag;
  final GestureRecognizer Function(String string)? recognizer;
  get regExp => between(
        start: '<$tag>',
        end: '</$tag>',
        caseSensitive: caseSensitive,
      );
  get transformMatch => ((match) {
        String res = match;
        res = res.replaceFirst('<$tag>', '');
        res = res.replaceFirst('</$tag>', '');
        return res;
      });
  RegExp between({
    required String start,
    required String end,
    bool caseSensitive = false,
    bool multiLine = true,
  }) {
    const String backslash = r'\';
    return RegExp(
      "$backslash$start(.*?)$backslash$end",
      caseSensitive: caseSensitive,
      multiLine: multiLine,
    );
  }

  JTextStyle(
    String tag, {
    this.caseSensitive = false,
    this.recognizer,
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  })  : tag = tag.replaceAll(RegExp(r'<|>|\|'), ''),
        super(
          inherit: inherit,
          color: color,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          leadingDistribution: leadingDistribution,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows,
          fontFeatures: fontFeatures,
          fontVariations: fontVariations,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          package: package,
          overflow: overflow,
        );
}
