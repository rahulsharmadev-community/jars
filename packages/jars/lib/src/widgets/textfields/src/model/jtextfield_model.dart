import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regpatterns/regpatterns.dart';
import 'package:jars/jars.dart';

import 'dart:ui' as ui;

// ignore: must_be_immutable
abstract class JTextFieldModel extends StatefulWidget {
  final bool numberFormatting;
  final String numberSeparator;
  final String? inital, labelText, helperText, hintText;
  final String? errorText, prefixText, suffixText, counterText;
  final Widget? label, error, prefixIcon, prefix;
  final Widget? emptyFieldSuffixIcon, filledFieldSuffixIcon, suffix, counter, leading;
  final void Function(String text)? onChange, onSubmitted;
  final VoidCallback? onClear, onTap, onDone;

  final void Function(String)? onValidator;

  final InputBorderConfig? borderConfig;

  final bool? isDense;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  final AutovalidateMode? autovalidateMode;
  final RegPattern? validatorPattern;
  final String? validatorText;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int? maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  /// {@macro flutter.widgets.editableText.maxLength}
  final int? maxLength;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType keyboardType;

  /// The type of action button to use for the keyboard.
  ///
  /// Defaults to [TextInputAction.done]
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool? enableInteractiveSelection;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  /// {@macro flutter.widgets.editableText.buildCounter}
  final InputCounterWidgetBuilder? buildCounter;

  final Iterable<String>? autofillHints;

  final ScrollController? scrollController;

  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool obscureText;
  final String obscuringCharacter;
  final StyleConfig styleConfig;
  final CursorConfig cursorConfig;
  final ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight;
  final ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight;
  final DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final bool showLimitText;

  JTextFieldModel({
    TextEditingController? controller,
    super.key,
    this.helperText,
    this.hintText,
    this.suffixText,
    this.counterText,
    this.error,
    this.prefix,
    this.suffix,
    this.counter,
    this.isDense,
    this.errorText,
    this.label,
    this.labelText,
    this.inital,
    this.textDirection,
    this.validatorPattern,
    this.validatorText,
    this.onClear,
    this.onTap,
    this.onChange,
    this.onSubmitted,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.autofillHints,
    this.scrollController,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.onAppPrivateCommand,
    this.prefixIcon,
    this.prefixText,
    this.leading,
    this.emptyFieldSuffixIcon,
    this.filledFieldSuffixIcon,
    int? minLines,
    int? maxLines,
    this.maxLengthEnforcement,
    this.readOnly = false,
    this.autofocus = false,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.expands = false,
    this.numberFormatting = false,
    this.showLimitText = false,
    this.numberSeparator = ',',
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.styleConfig = const StyleConfig(),
    this.cursorConfig = const CursorConfig(),
    this.borderConfig,
    this.onDone,
    AutovalidateMode? autovalidateMode,
    this.onValidator,
  })  : maxLength = inputFormatters == null && showLimitText ? maxLength : null,
        inputFormatters = inputFormatters ??
            [if (maxLength != null && !showLimitText) LengthLimitingTextInputFormatter(maxLength)],
        minLines = expands ? null : minLines,
        maxLines = expands ? null : maxLines,
        controller = controller ?? TextEditingController(text: inital),
        autovalidateMode =
            validatorPattern != null ? autovalidateMode ?? AutovalidateMode.onUserInteraction : null;

  InputDecoration inputDecoration(ColorScheme colors) {
    var bg = borderConfig ??
        (Platform.isMobileorTablet ? InputBorderConfig.rounded() : InputBorderConfig.outline());
    return InputDecoration(
      isDense: isDense ?? Platform.isMobileorTablet,
      hintText: hintText,
      helperText: helperText,
      suffixText: suffixText,
      counterText: counterText,
      error: error,
      prefix: prefix,
      suffix: suffix,
      counter: counter,
      label: label,
      labelText: labelText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      icon: leading,
      iconColor: styleConfig.iconColor,
      labelStyle: styleConfig.labelStyle,
      floatingLabelStyle: styleConfig.floatingLabelStyle,
      helperStyle: styleConfig.helperStyle,
      hintStyle: styleConfig.hintStyle,
      hintTextDirection: styleConfig.hintTextDirection,
      hintMaxLines: styleConfig.hintMaxLines,
      errorStyle: styleConfig.errorStyle,
      prefixIconConstraints: styleConfig.prefixIconConstraints,
      prefixStyle: styleConfig.prefixStyle,
      prefixIconColor: styleConfig.prefixIconColor,
      suffixStyle: styleConfig.suffixStyle,
      suffixIconColor: styleConfig.suffixIconColor,
      suffixIconConstraints: styleConfig.suffixIconConstraints,
      counterStyle: styleConfig.counterStyle,
      filled: styleConfig.filled,
      fillColor: styleConfig.fillColor,
      focusColor: styleConfig.focusColor,
      hoverColor: styleConfig.hoverColor,
      helperMaxLines: styleConfig.helperMaxLines,
      errorMaxLines: styleConfig.errorMaxLines,
      suffixIcon: controller.text.isEmpty ? emptyFieldSuffixIcon : filledFieldSuffixIcon ?? clearButton(),
      border: bg.border.copyWith(borderSide: BorderSide(color: colors.onSurface)),
      errorBorder: bg.errorBorder.copyWith(borderSide: BorderSide(color: colors.error)),
      enabledBorder: bg.enabledBorder.copyWith(borderSide: BorderSide(color: colors.onSurface)),
      focusedBorder: bg.focusedBorder.copyWith(borderSide: BorderSide(color: colors.primary)),
      disabledBorder: bg.disabledBorder
          .copyWith(borderSide: BorderSide(color: colors.onSurfaceVariant.withOpacity(0.35))),
      focusedErrorBorder: bg.focusedErrorBorder.copyWith(
        borderSide: BorderSide(color: colors.primary),
      ),
    );
  }

  IconButton clearButton() {
    var text = controller.text;
    return IconButton(
        onPressed: () {
          controller.clear();
          if (onChange != null) {
            onChange!(text);
            if (onSubmitted != null) onSubmitted!(text);
          }
        },
        icon: const Icon(Icons.close_rounded));
  }
}

class StyleConfig {
  final Color? iconColor, fillColor, focusColor, hoverColor;
  final Color? prefixIconColor, suffixIconColor;
  final TextStyle? style;
  final TextStyle? labelStyle, floatingLabelStyle, helperStyle, hintStyle;
  final TextStyle? errorStyle, prefixStyle, suffixStyle, counterStyle;

  /// The maximum number of lines the text can occupy.
  ///
  /// Defaults to null, which means that the text will be limited
  /// to a single line with [TextOverflow.ellipsis].
  final int? helperMaxLines, hintMaxLines, errorMaxLines;

  ///If true the decoration's container is filled with [fillColor].
  ///
  /// When [InputDecorator.isHovering] is true, the [hoverColor] is also blended
  /// into the final fill color.
  final bool? filled;

  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final TextDirection? hintTextDirection;

  const StyleConfig(
      {this.style,
      this.iconColor,
      this.labelStyle,
      this.floatingLabelStyle,
      this.helperStyle,
      this.hintStyle =
          const TextStyle(letterSpacing: 0, fontWeight: FontWeight.normal, overflow: TextOverflow.ellipsis),
      this.hintTextDirection,
      this.hintMaxLines,
      this.errorStyle,
      this.prefixIconConstraints,
      this.prefixStyle,
      this.prefixIconColor,
      this.suffixStyle,
      this.suffixIconColor,
      this.suffixIconConstraints,
      this.counterStyle,
      this.filled,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.helperMaxLines,
      this.errorMaxLines = 2});

  StyleConfig copyWith({
    Color? iconColor,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? prefixIconColor,
    Color? suffixIconColor,
    TextStyle? style,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    TextStyle? helperStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? prefixStyle,
    TextStyle? suffixStyle,
    TextStyle? counterStyle,
    int? helperMaxLines,
    int? hintMaxLines,
    int? errorMaxLines,
    bool? filled,
    BoxConstraints? suffixIconConstraints,
    BoxConstraints? prefixIconConstraints,
    TextDirection? hintTextDirection,
  }) {
    return StyleConfig(
      iconColor: iconColor ?? this.iconColor,
      fillColor: fillColor ?? this.fillColor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      prefixIconColor: prefixIconColor ?? this.prefixIconColor,
      suffixIconColor: suffixIconColor ?? this.suffixIconColor,
      style: style ?? this.style,
      labelStyle: labelStyle ?? this.labelStyle,
      floatingLabelStyle: floatingLabelStyle ?? this.floatingLabelStyle,
      helperStyle: helperStyle ?? this.helperStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      prefixStyle: prefixStyle ?? this.prefixStyle,
      suffixStyle: suffixStyle ?? this.suffixStyle,
      counterStyle: counterStyle ?? this.counterStyle,
      helperMaxLines: helperMaxLines ?? this.helperMaxLines,
      hintMaxLines: hintMaxLines ?? this.hintMaxLines,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
      filled: filled ?? this.filled,
      suffixIconConstraints: suffixIconConstraints ?? this.suffixIconConstraints,
      prefixIconConstraints: prefixIconConstraints ?? this.prefixIconConstraints,
      hintTextDirection: hintTextDirection ?? this.hintTextDirection,
    );
  }
}

class CursorConfig {
  final bool? showCursor;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final bool? cursorOpacityAnimates;
  const CursorConfig({
    this.cursorWidth = 2.0,
    this.showCursor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorOpacityAnimates,
  });
  CursorConfig copyWith({
    bool? showCursor,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    bool? cursorOpacityAnimates,
  }) {
    return CursorConfig(
      cursorWidth: cursorWidth ?? this.cursorWidth,
      showCursor: showCursor ?? this.showCursor,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorOpacityAnimates: cursorOpacityAnimates ?? this.cursorOpacityAnimates,
    );
  }
}

class InputBorderConfig {
  final InputBorder errorBorder, focusedBorder, focusedErrorBorder;
  final InputBorder disabledBorder, enabledBorder, border;
  const InputBorderConfig({
    required this.errorBorder,
    required this.focusedBorder,
    required this.focusedErrorBorder,
    required this.disabledBorder,
    required this.enabledBorder,
    required this.border,
  });

  factory InputBorderConfig.underline({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
  }) {
    var temp = UnderlineInputBorder(
      borderSide: borderSide ?? const BorderSide(width: 0.7),
      borderRadius: borderRadius ?? (4, 4, 0, 0).rounded,
    );
    return InputBorderConfig(
        errorBorder: temp,
        focusedBorder: temp,
        focusedErrorBorder: temp,
        disabledBorder: temp,
        enabledBorder: temp,
        border: temp);
  }

  factory InputBorderConfig.outline({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
    double? gapPadding,
  }) {
    var temp = OutlineInputBorder(
        borderSide: borderSide ?? const BorderSide(width: 0.7),
        borderRadius: borderRadius ?? 4.rounded,
        gapPadding: gapPadding ?? 4);
    return InputBorderConfig(
        errorBorder: temp,
        focusedBorder: temp,
        focusedErrorBorder: temp,
        disabledBorder: temp,
        enabledBorder: temp,
        border: temp);
  }

  InputBorderConfig copyWith(
      {InputBorder? errorBorder,
      InputBorder? focusedBorder,
      InputBorder? focusedErrorBorder,
      InputBorder? disabledBorder,
      InputBorder? enabledBorder,
      InputBorder? border}) {
    return InputBorderConfig(
      errorBorder: errorBorder ?? this.errorBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      border: border ?? this.border,
    );
  }

  factory InputBorderConfig.rounded({
    BorderSide? borderSide,
    double? radius,
    double? gapPadding,
  }) {
    return InputBorderConfig.outline(
      borderRadius: (radius ?? 12).rounded,
      borderSide: borderSide,
      gapPadding: gapPadding,
    );
  }
}
