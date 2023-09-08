import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text copyWith(
      {String? data,
      TextStyle? style,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      Color? selectionColor,
      TextHeightBehavior? textHeightBehavior}) {
    return Text(
      data ?? this.data ?? "",
      key: key,
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      locale: locale ?? this.locale,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      softWrap: softWrap ?? this.softWrap,
      textDirection: textDirection ?? this.textDirection,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      selectionColor: selectionColor ?? this.selectionColor,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    );
  }

  Text scale(double scaleFactor) => copyWith(textScaleFactor: scaleFactor);

  Text selectionColor(Color color) => copyWith(selectionColor: color);

  Text overflow(TextOverflow overflow) => copyWith(overflow: overflow);

  TextStyle get _style => style ?? const TextStyle();

  /// The most thick - FontWeight.w900
  Text get mostThick {
    return copyWith(style: _style.copyWith(fontWeight: FontWeight.w900));
  }

  /// Extra-bold - FontWeight.w800
  Text get extraBold =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w800));

  /// Bold - FontWeight.bold - FontWeight.w700
  Text get bold =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w700));

  /// Semi-bold - FontWeight.w600
  Text get semiBold =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w600));

  /// Medium - FontWeight.w500
  Text get medium =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w500));

  /// Regular - FontWeight.w400
  Text get regular =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w400));

  /// Light - FontWeight.w300
  Text get light =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w300));

  /// Extra-light - FontWeight.w200
  Text get extraLight =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w200));

  /// Thin, the least thick - FontWeight.w100
  Text get thin =>
      copyWith(style: _style.copyWith(fontWeight: FontWeight.w100));

  Text fontWeight(FontWeight fontWeight) => copyWith(
        style: _style.copyWith(fontWeight: fontWeight),
      );

  Text fontSize(double size) => copyWith(
        style: _style.copyWith(
          fontSize: size,
        ),
      );

  Text fontFamily(String font) => copyWith(
        style: _style.copyWith(
          fontFamily: font,
        ),
      );

  Text letterSpacing(double space) => copyWith(
        style: _style.copyWith(
          letterSpacing: space,
        ),
      );

  Text wordSpacing(double space) => copyWith(
        style: _style.copyWith(
          wordSpacing: space,
        ),
      );

  Text color(Color color) => copyWith(
        style: _style.copyWith(
          color: color,
        ),
      );

  Text align(TextAlign align) => copyWith(textAlign: align);

  Text textDirection(TextDirection direction) {
    return copyWith(textDirection: direction);
  }

  Text textBaseline(TextBaseline textBaseline) => copyWith(
        style: _style.copyWith(textBaseline: textBaseline),
      );

  Text textWidthBasis(TextWidthBasis textWidthBasis) {
    return copyWith(textWidthBasis: textWidthBasis);
  }

  Text get underline =>
      copyWith(style: _style.copyWith(decoration: TextDecoration.underline));
  Text get overline =>
      copyWith(style: _style.copyWith(decoration: TextDecoration.overline));
  Text get lineThrough =>
      copyWith(style: _style.copyWith(decoration: TextDecoration.lineThrough));
}
