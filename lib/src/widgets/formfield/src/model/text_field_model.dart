import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:jars/utility.dart';

// ignore: must_be_immutable
abstract class JTextFieldModel extends StatefulWidget {
  final bool numberFormatting;
  final String numberSeparator;
  final String? inital, labelText, helperText, hintText;
  final String? errorText, prefixText, suffixText, counterText;
  final Widget? label, error, prefixIcon, prefix;
  final Widget? suffixIcon, suffix, counter, leading;
  final void Function(String text)? onChange, onSubmitted;
  final VoidCallback? onClear, onTap;
  VoidCallback? onFocus;
  final BorderConfig borderConfig;

  final bool isDense;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  final AutovalidateMode? autovalidateMode;
  final RegPatterns? validatorPattern;
  final String? validatorText;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int maxLines;

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

  JTextFieldModel({
    super.key,
    this.helperText,
    this.hintText,
    this.suffixText,
    this.counterText,
    this.error,
    this.prefix,
    this.suffix,
    this.counter,
    this.isDense = true,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLength,
    this.errorText,
    this.label,
    this.labelText,
    this.inital,
    this.textDirection,
    this.autovalidateMode,
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
    this.suffixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.autofocus = false,
    this.inputFormatters = const [],
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.expands = false,
    this.numberFormatting = false,
    this.numberSeparator = ',',
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.styleConfig = const StyleConfig(),
    this.cursorConfig = const CursorConfig(),
    this.borderConfig = const BorderConfig(),
  })  : assert(maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || minLines == null,
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0);

  InputDecoration get inputDecoration => InputDecoration(
        isDense: isDense,
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
        suffixIcon: suffixIcon,
        border: borderConfig.border,
        errorBorder: borderConfig.errorBorder,
        enabledBorder: borderConfig.enabledBorder,
        focusedBorder: borderConfig.focusedBorder,
        disabledBorder: borderConfig.disabledBorder,
        focusedErrorBorder: borderConfig.focusedErrorBorder,
      );
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
      this.hintStyle = const TextStyle(
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis),
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
      this.errorMaxLines});
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
}

class BorderConfig {
  final InputBorder? errorBorder, focusedBorder, focusedErrorBorder;
  final InputBorder? disabledBorder, enabledBorder, border;
  const BorderConfig({
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
  });
}
