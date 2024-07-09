// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:jars/intl.dart';

// ignore: must_be_immutable
class DateTimeJTextField extends JTextFieldModel {
  final DatePickerConfig? datePickerConfig;
  final TimePickerConfig? timePickerConfig;
  final String Function(DateTime?, TimeOfDay?) setValue;
  DateTimeJTextField({
    super.key,
    String Function(DateTime?, TimeOfDay?)? setValue,
    this.datePickerConfig,
    this.timePickerConfig,
    super.inputFormatters = const [],
    super.errorText,
    super.label,
    super.labelText,
    super.inital,
    super.onChange,
    super.onSubmitted,
    super.borderConfig,
    super.textDirection,
    super.textAlign = TextAlign.start,
    super.onTap,
    super.enableInteractiveSelection,
    super.selectionControls,
    super.autofillHints,
    super.scrollController,
    super.magnifierConfiguration,
    super.prefixIcon,
    super.prefixText,
    super.leading,
    super.helperText,
    super.hintText,
    super.suffixText,
    super.error,
    super.prefix,
    super.suffix,
    super.isDense,
    super.styleConfig,
    super.onDone,
    super.emptyFieldSuffixIcon = const Icon(Icons.calendar_month_rounded),
  })  : assert(datePickerConfig != null || timePickerConfig != null),
        setValue = setValue ?? _defaultSetValue;

  static String _defaultSetValue(DateTime? dateTime, TimeOfDay? time) {
    return [
      if (dateTime != null) DateFormat.yMMMd().format(dateTime),
      if (time != null) const DefaultMaterialLocalizations().formatTimeOfDay(time)
    ].join(' | ');
  }

  @override
  State<DateTimeJTextField> createState() => _DateTimeTextFieldState();
}

class _DateTimeTextFieldState extends State<DateTimeJTextField> {
  TextEditingController get controller => widget.controller;

  DatePickerConfig? get datePickerConfig => widget.datePickerConfig;
  TimePickerConfig? get timePickerConfig => widget.timePickerConfig;
  late FocusNode focusNode;
  bool isDialogOpen = false;
  bool canAttempt = true;

  bool get isDateTimePicker => datePickerConfig != null && timePickerConfig != null;
  String get cText => controller.text;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() async {
      if (!focusNode.hasFocus) canAttempt = true;
      if (canAttempt && cText.isEmpty) {
        await _showDialog();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  Future<void> _showDialog() async {
    if (isDialogOpen) return;
    isDialogOpen = true;
    DateTime? dateTime;
    TimeOfDay? time;
    if (datePickerConfig != null) {
      dateTime = await datePickerConfig!.showDateDialog(context);
    }
    if (timePickerConfig != null) {
      if (!isDateTimePicker) {
        time = await timePickerConfig!.showTimeDialog(context);
      } else if (dateTime != null) {
        time = await timePickerConfig!.showTimeDialog(context);
      }
    }

    isDialogOpen = false;
    canAttempt = false;
    controller.text = widget.setValue(dateTime, time);
    _onSubmitted();
    canAttempt = true;
    setState(() {});
  }

  InputBorder textfieldBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0.7, color: color),
      );

  void _onSubmitted() {
    if (widget.onSubmitted != null) widget.onSubmitted!(cText);
    if (widget.onDone != null) widget.onDone!();
  }

  @override
  Widget build(BuildContext context) {
    var colors = context.colorScheme;
    return TextFormField(
      readOnly: true,
      focusNode: focusNode,
      controller: controller,
      style: widget.styleConfig.style,
      expands: widget.expands,
      textDirection: widget.textDirection,
      autofocus: widget.autofocus,
      cursorWidth: widget.cursorConfig.cursorWidth,
      textAlign: widget.textAlign,
      onTap: () async {
        if (widget.onTap != null) widget.onTap!();
        await _showDialog();
      },
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectionControls: widget.selectionControls,
      autofillHints: widget.autofillHints,
      scrollController: widget.scrollController,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      magnifierConfiguration: widget.magnifierConfiguration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorHeight: widget.cursorConfig.cursorHeight,
      cursorRadius: widget.cursorConfig.cursorRadius,
      cursorColor: widget.cursorConfig.cursorColor,
      cursorOpacityAnimates: widget.cursorConfig.cursorOpacityAnimates,
      showCursor: widget.cursorConfig.showCursor,
      inputFormatters: widget.inputFormatters,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      dragStartBehavior: widget.dragStartBehavior,
      decoration: widget.inputDecoration(colors),
      onChanged: (text) {
        if (widget.onChange != null) widget.onChange!(text);
        if (mounted) setState(() {});
      },
    );
  }
}
