import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jars/jars.dart';

// ignore: must_be_immutable
class JTextField extends JTextFieldModel {
  JTextField(
      {super.key,
      super.controller,
      super.inputFormatters,
      super.maxLengthEnforcement,
      super.cursorConfig,
      super.readOnly,
      super.maxLines,
      super.minLines,
      super.expands,
      super.maxLength,
      super.errorText,
      super.label,
      super.labelText,
      super.onClear,
      super.inital,
      super.onChange,
      super.onSubmitted,
      super.styleConfig,
      super.borderConfig,
      super.textDirection,
      super.autofocus,
      super.textAlign,
      super.autovalidateMode,
      super.validatorPattern,
      super.validatorText,
      super.onValidator,
      super.onTap,
      super.enableInteractiveSelection,
      super.selectionControls,
      super.buildCounter,
      super.autofillHints,
      super.scrollController,
      super.spellCheckConfiguration,
      super.magnifierConfiguration,
      super.onAppPrivateCommand,
      super.keyboardType,
      super.textInputAction,
      super.prefixIcon,
      super.prefixText,
      super.leading,
      super.suffixIcon,
      super.obscureText,
      super.helperText,
      super.hintText,
      super.suffixText,
      super.counterText,
      super.error,
      super.prefix,
      super.suffix,
      super.counter,
      super.isDense,
      super.numberFormatting,
      super.numberSeparator,
      super.obscuringCharacter,
      super.onDone});

  JTextField.obscureField({
    super.key,
    super.controller,
    super.cursorConfig,
    super.maxLengthEnforcement,
    super.maxLines = 1,
    super.minLines,
    super.maxLength,
    super.errorText,
    super.label,
    super.labelText,
    super.onClear,
    super.inital,
    super.onChange,
    super.onSubmitted,
    super.borderConfig,
    super.textDirection,
    super.autovalidateMode,
    super.validatorPattern,
    super.validatorText,
    super.onValidator,
    super.onTap,
    super.enableInteractiveSelection,
    super.selectionControls,
    super.buildCounter,
    super.autofillHints,
    super.scrollController,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.onAppPrivateCommand,
    super.prefixIcon,
    super.prefixText,
    super.leading,
    super.obscuringCharacter = '●',
    super.expands = false,
    super.readOnly = false,
    super.autofocus = false,
    super.textAlign = TextAlign.start,
    super.inputFormatters = const [],
    super.keyboardType = TextInputType.text,
    super.textInputAction = TextInputAction.done,
    super.suffixIcon,
    super.helperText,
    super.hintText,
    super.suffixText,
    super.counterText,
    super.error,
    super.prefix,
    super.suffix,
    super.counter,
    super.isDense,
    super.onDone,
    super.styleConfig = const StyleConfig(style: TextStyle(letterSpacing: 2)),
  }) : super(obscureText: true);

  @override
  State<JTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<JTextField> {
  late TextEditingController controller;

  String get cText => controller.text;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.inital);
  }

  @override
  void dispose() {
    if (widget.controller == null) controller.dispose();
    super.dispose();
  }

  InputBorder textfieldBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0.7, color: color),
      );

  void _onSubmitted(String newText) {
    if (widget.onSubmitted != null) {
      if (widget.numberFormatting) {
        newText = newText.replaceAll(widget.numberSeparator, '');
        newText = double.tryParse(newText) != null ? newText : cText;
      }
      widget.onSubmitted!(newText);
    }
    if (widget.onDone != null) widget.onDone!();
  }

  void _onChange(String newText) {
    if (widget.onChange != null) {
      if (widget.numberFormatting) {
        newText = newText.replaceAll(widget.numberSeparator, '');
        newText = double.tryParse(newText) != null ? newText : newText;
      }
      widget.onChange!(newText);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var colors = context.colorScheme;
    return TextFormField(
        controller: controller,
        style: widget.styleConfig.style,
        readOnly: widget.readOnly,
        onFieldSubmitted: _onSubmitted,
        textDirection: widget.textDirection,
        autofocus: widget.autofocus,
        cursorWidth: widget.cursorConfig.cursorWidth,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        onTap: widget.onTap,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        buildCounter: widget.buildCounter,
        autofillHints: widget.autofillHints,
        scrollController: widget.scrollController,
        spellCheckConfiguration: widget.spellCheckConfiguration,
        magnifierConfiguration: widget.magnifierConfiguration,
        onAppPrivateCommand: widget.onAppPrivateCommand,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        cursorHeight: widget.cursorConfig.cursorHeight,
        cursorRadius: widget.cursorConfig.cursorRadius,
        cursorColor: widget.cursorConfig.cursorColor,
        cursorOpacityAnimates: widget.cursorConfig.cursorOpacityAnimates,
        showCursor: widget.cursorConfig.showCursor,
        obscureText: widget.obscureText,
        obscuringCharacter: widget.obscuringCharacter,
        inputFormatters: [
          if (widget.numberFormatting) NumberFormatting(widget.numberSeparator),
          ...widget.inputFormatters
        ],
        selectionHeightStyle: widget.selectionHeightStyle,
        selectionWidthStyle: widget.selectionWidthStyle,
        dragStartBehavior: widget.dragStartBehavior,
        autovalidateMode: widget.autovalidateMode,
        validator: (value) {
          var text = value;
          if (text != null && widget.validatorPattern != null && !text.regMatch(widget.validatorPattern!)) {
            var msg = widget.validatorText ?? widget.validatorPattern?.message ?? 'format error!';
            if (widget.onValidator != null) widget.onValidator!(msg);
            return msg;
          }
          return null;
        },
        decoration: widget.inputDecoration.copyWith(
          suffixIcon: cText.isEmpty ? null : widget.suffixIcon ?? clearButton(),
          border: widget.borderConfig.border ?? textfieldBorder(colors.onSurface),
          errorBorder: widget.borderConfig.errorBorder ?? textfieldBorder(colors.error),
          enabledBorder: widget.borderConfig.enabledBorder ?? textfieldBorder(colors.onSurface),
          focusedBorder: widget.borderConfig.focusedBorder ?? textfieldBorder(colors.primary),
          disabledBorder: widget.borderConfig.disabledBorder ??
              textfieldBorder(colors.onSurfaceVariant.withOpacity(0.35)),
          focusedErrorBorder: widget.borderConfig.focusedErrorBorder ?? textfieldBorder(colors.primary),
        ),
        onChanged: _onChange,
        onEditingComplete: () => _onSubmitted(cText));
  }

  IconButton clearButton() {
    return IconButton(
        onPressed: () {
          controller.clear();
          _onChange(cText);
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(cText);
          }
        },
        icon: const Icon(Icons.close_rounded));
  }
}

class NumberFormatting extends TextInputFormatter {
  final String separator;
  const NumberFormatting([this.separator = ',']);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAllMapped(RegExp(r'[ .,!@#\$%^&*()_+{}":;>?<[\]]+'), (match) {
      // Replace commas with an empty string

      var other = match.group(0)!;
      var contains = ' ,!@#\$%^&*()_+{}":>?<[]'.contains(other);

      if (contains) {
        return '';
      }
      // Replace multiple consecutive dots or spaces with a single dot or space
      else {
        return '.'; // Returns the first character of the match
      }
    });
    if (double.tryParse(text) != null) {
      var res = text.separate(separator: separator);
      return newValue.copyWith(
        text: res,
        selection: TextSelection.fromPosition(
          TextPosition(offset: res.length), // Set the cursor at the end
        ),
      );
    }
    return newValue;
  }
}
