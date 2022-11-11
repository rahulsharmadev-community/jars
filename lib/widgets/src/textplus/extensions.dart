// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import '../../../core/src/extensions/library_extensions.dart';

extension TextStyleExtension on TextStyle {
  String get toTextPlusStyle {
    return jsonEncode({
      'inherit': inherit,
      'color': color?.toHex,
      'backgroundColor': backgroundColor?.toHex,
      'fontSize': fontSize,
      'fontWeight': fontWeight?.index,
      'fontStyle': fontStyle?.index,
      'letterSpacing': letterSpacing,
      'wordSpacing': wordSpacing,
      'textBaseline': textBaseline?.index,
      'height': height,
      'leadingDistribution': leadingDistribution?.index,
      'shadows': shadows
          ?.map((e) => <String, dynamic>{
                'blurRadius': e.blurRadius,
                'color': e.color.toHex,
                'offset': {'dx': e.offset.dx, 'dy': e.offset.dy}
              })
          .toList(),
      'fontFeatures': fontFeatures
          ?.map(
              (e) => <String, dynamic>{'feature': e.feature, 'value': e.value})
          .toList(),
      'fontVariations': fontVariations
          ?.map((e) => <String, dynamic>{'axis': e.axis, 'value': e.value})
          .toList(),
      'decoration': decoration?.toString(),
      'decorationColor': decorationColor?.toHex,
      'decorationStyle': decorationStyle?.index,
      'decorationThickness': decorationThickness,
      'debugLabel': debugLabel,
      'fontFamily': fontFamily,
      'fontFamilyFallback': fontFamilyFallback,
      'overflow': overflow?.index,
    });
  }
}

extension MapExtension on Map<String, dynamic> {
  List<Shadow>? _createShadows() {
    if (this['shadows'] == null) return null;
    return List<Map<String, dynamic>>.from(this['shadows'])
        .map((e) => Shadow(
            blurRadius: e['blurRadius'],
            color: '${e['color']}'.toColor,
            offset: Offset(
              e['offset']["dx"],
              e['offset']["dy"],
            )))
        .toList();
  }

  List<FontVariation>? _createfontVariations() {
    if (this['fontVariations'] == null) return null;
    return List<Map<String, dynamic>>.from(this['fontVariations'])
        .map((e) => FontVariation(e['axis'], e['value']))
        .toList();
  }

  List<FontFeature>? _createfontFeatures() {
    if (this['fontFeatures'] == null) return null;
    return List<Map<String, dynamic>>.from(this['fontFeatures'])
        .map((e) => FontFeature(e['feature'], e['value']))
        .toList();
  }

  TextDecoration? _createTextDecoration() {
    if (this['decoration'] == null) return null;

    List<TextDecoration> temp = [];
    if (this['decoration'].contains('underline')) {
      temp.add(TextDecoration.underline);
    }
    if (this['decoration'].contains('overline')) {
      temp.add(TextDecoration.overline);
    }
    if (this['decoration'].contains('lineThrough')) {
      temp.add(TextDecoration.lineThrough);
    }
    return TextDecoration.combine(temp);
  }

  TextStyle get fromTextPlusStyle {
    return TextStyle(
      inherit: this['inherit'],
      color: this['color']?.toString().toColor,
      backgroundColor: this['backgroundColor']?.toString().toColor,
      fontSize: this['fontSize'],
      fontWeight: this['fontWeight'] != null
          ? FontWeight.values[this['fontWeight']]
          : null,
      fontStyle: this['fontStyle'] != null
          ? FontStyle.values[this['fontStyle']]
          : null,
      letterSpacing: this['letterSpacing'],
      wordSpacing: this['wordSpacing'],
      textBaseline: this['textBaseline'] != null
          ? TextBaseline.values[this['textBaseline']]
          : null,
      height: this['height'],
      leadingDistribution: this['leadingDistribution'] != null
          ? TextLeadingDistribution.values[this['leadingDistribution']]
          : null,
      shadows: _createShadows(),
      fontFeatures: _createfontFeatures(),
      fontVariations: _createfontVariations(),
      decoration: _createTextDecoration(),
      decorationColor: this['decorationColor']?.toString().toColor,
      decorationStyle: this['decorationStyle'] != null
          ? TextDecorationStyle.values[this['decorationStyle']]
          : null,
      decorationThickness: this['decorationThickness'],
      debugLabel: this['debugLabel'],
      fontFamily: this['fontFamily'],
      fontFamilyFallback: this['fontFamilyFallback'],
      overflow: this['overflow'] != null
          ? TextOverflow.values[this['overflow']]
          : null,
    );
  }
}
