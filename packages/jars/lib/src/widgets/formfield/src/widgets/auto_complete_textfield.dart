import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

// ignore: must_be_immutable
class SmartJTextField extends JTextFieldModel {
  final List<String> options;
  final AutoCompleteBoxDecoration decoration;
  final AutoCompleteConfig configuration;

  SmartJTextField.autoCompleteField(
      {required this.options,
      final AutoCompleteBoxDecoration? decoration,
      final AutoCompleteConfig? configuration,
      super.key,
      super.cursorConfig,
      super.inputFormatters = const [],
      super.maxLengthEnforcement,
      int lines = 1,
      super.expands = false,
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
      super.autofocus = false,
      super.textAlign = TextAlign.start,
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
      super.magnifierConfiguration,
      super.keyboardType = TextInputType.text,
      super.textInputAction = TextInputAction.done,
      super.prefixIcon,
      super.prefixText,
      super.leading,
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
      super.styleConfig,
      super.controller,
      super.onDone})
      : decoration = decoration ?? const AutoCompleteBoxDecoration(),
        configuration = configuration ?? AutoCompleteConfig(),
        super(minLines: lines, maxLines: lines);

  SmartJTextField.dropdownField(
      {required this.options,
      this.decoration = const AutoCompleteBoxDecoration(),
      super.key,
      super.inputFormatters = const [],
      super.errorText,
      super.label,
      super.labelText,
      super.inital,
      super.onChange,
      super.borderConfig,
      super.textDirection,
      super.textAlign = TextAlign.start,
      super.autovalidateMode,
      super.validatorPattern,
      super.validatorText,
      super.onTap,
      super.enableInteractiveSelection,
      super.selectionControls,
      super.buildCounter,
      super.autofillHints,
      super.scrollController,
      super.magnifierConfiguration,
      super.prefixIcon,
      super.prefixText,
      super.leading,
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
      super.styleConfig,
      super.controller,
      super.onDone})
      : configuration = AutoCompleteConfig(
            showOptionsOnEmptyField: true, openCloseIndicator: true, disabledTextField: true);

  @override
  State<SmartJTextField> createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<SmartJTextField> {
  late bool hasBoxNotOpen;
  late bool hasNotfocus;

  List<String> get options => widget.options;
  AutoCompleteBoxDecoration get decoration => widget.decoration;
  AutoCompleteConfig get configuration => widget.configuration;
  late FocusNode focusNode;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    hasBoxNotOpen = true;
    hasNotfocus = true;
    focusNode = FocusNode();
    controller = widget.controller ?? TextEditingController(text: widget.inital);
  }

  @override
  void dispose() {
    focusNode.dispose();
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  InputBorder textfieldBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0.7, color: color),
      );

  FutureOr<Iterable<String>> optionsBuilder(TextEditingValue editingValue) async {
    setState(() => hasBoxNotOpen = editingValue.text.isNotEmpty);

    var ls = options.where((e) {
      return e.toLowerCase().contains(editingValue.text.toLowerCase());
    });

    if (configuration.disabledTextField ||
        (editingValue.text.isBlank && configuration.showOptionsOnEmptyField)) {
      return ls;
    }

    if (editingValue.text.isBlank) {
      return [];
    }

    return ls;
  }

  void _onSelected(String text) {
    text = text.trim();
    if (widget.onChange != null) widget.onChange!(text);
    _onSubmitted(text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      focusNode: focusNode,
      textEditingController: controller,
      optionsViewBuilder: optionsViewBuilder,
      optionsBuilder: optionsBuilder,
      fieldViewBuilder: fieldViewBuilder,
      onSelected: _onSelected,
    );
  }

  get dropContainerWidth =>
      (textfieldKey.currentContext?.findRenderObject() as RenderBox?)?.size.width ?? context.widthOf(50);

  Offset? get position =>
      (textfieldKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero);
  GlobalKey key2 = GlobalKey();
  Widget optionsViewBuilder(
    BuildContext context,
    void Function(String) onSelected,
    Iterable<String> options,
  ) {
    var keyboardArea = context.mediaQuery.viewInsets.bottom;
    double heightLimit = context.screenSize.height - keyboardArea - (position?.dy ?? 0);
    double maxHeight = (decoration.maxHeight ?? context.heightOf(50));
    return Align(
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight > heightLimit ? heightLimit - kBottomNavigationBarHeight : maxHeight,
          maxWidth: dropContainerWidth,
        ),
        child: Material(
          elevation: decoration.elevation,
          clipBehavior: decoration.clipBehavior,
          shape: decoration.shape,
          type: decoration.type,
          color: decoration.color,
          child: ListView.separated(
            padding: decoration.scrollPadding ?? const EdgeInsets.symmetric(vertical: 8),
            itemCount: options.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              var e = options.elementAt(index);
              return InkWell(
                onTap: () => onSelected(e),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    e,
                    style: context.textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onSubmitted(String text) {
    if (widget.onDone != null) widget.onDone!();
    if (widget.onSubmitted != null) widget.onSubmitted!(text);
  }

  GlobalKey textfieldKey = GlobalKey();
  Widget fieldViewBuilder(BuildContext context, TextEditingController controller, FocusNode focusNode,
      Function() onFieldSubmitted) {
    var colors = context.colorScheme;

    controller.addListener(
      () {},
    );
    return TextFieldTapRegion(
      onTapOutside: (event) {
        if (focusNode.hasFocus && configuration.disabledTextField) {
          focusNode.unfocus();
        }
      },
      child: TextFormField(
        key: textfieldKey,
        focusNode: focusNode
          ..addListener(() {
            setState(() => hasNotfocus = !focusNode.hasPrimaryFocus);
          }),
        controller: controller,
        style: widget.styleConfig.style,
        readOnly: configuration.disabledTextField,
        onFieldSubmitted: _onSubmitted,
        expands: widget.expands,
        textDirection: widget.textDirection,
        autofocus: widget.autofocus,
        cursorWidth: widget.cursorConfig.cursorWidth,
        textAlign: widget.textAlign,
        autovalidateMode: widget.autovalidateMode,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
          if (configuration.disabledTextField) {
            controller.clear();
            if (widget.onChange != null) widget.onChange!('');
          }
        },
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
        inputFormatters: widget.inputFormatters,
        selectionHeightStyle: widget.selectionHeightStyle,
        selectionWidthStyle: widget.selectionWidthStyle,
        dragStartBehavior: widget.dragStartBehavior,
        validator: (value) {
          if (value != null && widget.validatorPattern != null && !value.regMatch(widget.validatorPattern!)) {
            return widget.validatorText;
          }
          return null;
        },
        decoration: widget.inputDecoration.copyWith(
          suffixIcon: suffexButton(controller),
          border: widget.borderConfig.border ?? textfieldBorder(colors.onSurface),
          errorBorder: widget.borderConfig.errorBorder ?? textfieldBorder(colors.error),
          enabledBorder: widget.borderConfig.enabledBorder ?? textfieldBorder(colors.onSurface),
          focusedBorder: widget.borderConfig.focusedBorder ?? textfieldBorder(colors.primary),
          disabledBorder: widget.borderConfig.disabledBorder ??
              textfieldBorder(colors.onSurfaceVariant.withOpacity(0.35)),
          focusedErrorBorder: widget.borderConfig.focusedErrorBorder ?? textfieldBorder(colors.primary),
        ),
        onChanged: widget.onChange,
        onEditingComplete: () => _onSubmitted(controller.text),
      ),
    );
  }

  Widget? suffexButton(TextEditingController controller) {
    IconButton clearButton() {
      return IconButton(
          onPressed: () {
            controller.clear();
            if (widget.onChange != null) {
              widget.onChange!(controller.text);
            }
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(controller.text);
            }
            setState(() {});
          },
          icon: const Icon(Icons.close_rounded));
    }

    Widget? child;
    if (configuration.openCloseIndicator) {
      child = IconTheme(
        data: IconThemeData(
          color: !hasNotfocus ? context.colorScheme.primary : context.iconColor,
          size: 32,
        ),
        child: Icon(
          hasBoxNotOpen ? configuration.openIndicator : configuration.closeIndicator,
        ),
      );
    }
    return child ??= controller.text.isEmpty ? null : widget.suffixIcon ?? clearButton();
  }
}
