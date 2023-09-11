// ignore_for_file: must_be_immutable
export 'src/models/jtextstyle.dart';

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'src/models/jtextstyle.dart';
part 'src/logic/functions.dart';

class JTextPlus extends StatelessWidget {
  final String text;
  final List<JTextStyle> jTextStyles;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final int? maxLines;
  final TextHeightBehavior? textHeightBehavior;
  final TextWidthBasis? textWidthBasis;
  final String? semanticsLabel;
  JTextPlus(this.text,
      {super.key,
      required this.jTextStyles,
      this.style,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.textScaleFactor,
      this.maxLines,
      this.textHeightBehavior,
      this.textWidthBasis,
      this.semanticsLabel,
      Color? selectionColor,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow})
      : widget = Text.rich(
          _JTextPlusFunction.getChildTextSpan(
            defaultStyle: style,
            source: text,
            jStyles: jTextStyles,
          ),
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          locale: locale,
          strutStyle: strutStyle,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
          semanticsLabel: semanticsLabel,
        );

  JTextPlus.selectable(
    this.text, {
    super.key,
    required this.jTextStyles,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.maxLines,
    this.textHeightBehavior,
    this.textWidthBasis,
    this.semanticsLabel,
    FocusNode? focusNode,
    bool showCursor = false,
    bool autofocus = false,
    ToolbarOptions? toolbarOptions,
    int? minLines,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight,
    BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool enableInteractiveSelection = true,
    TextSelectionControls? selectionControls,
    void Function()? onTap,
    ScrollPhysics? scrollPhysics,
    void Function(TextSelection, SelectionChangedCause?)? onSelectionChanged,
  }) : widget = SelectableText.rich(
          _JTextPlusFunction.getChildTextSpan(
              defaultStyle: style, source: text, jStyles: jTextStyles),
          focusNode: focusNode,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          showCursor: showCursor,
          autofocus: autofocus,
          toolbarOptions: toolbarOptions,
          minLines: minLines,
          maxLines: maxLines,
          cursorWidth: cursorWidth = 2.0,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          dragStartBehavior: dragStartBehavior,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          onTap: onTap,
          scrollPhysics: scrollPhysics,
          semanticsLabel: semanticsLabel,
          textHeightBehavior: textHeightBehavior,
          textWidthBasis: textWidthBasis,
          onSelectionChanged: onSelectionChanged,
        );

  late final Widget widget;
  @override
  Widget build(BuildContext context) => widget;
}
