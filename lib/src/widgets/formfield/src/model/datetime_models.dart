
import 'package:flutter/material.dart';

class DatePickerConfig {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? currentDate;
  final Function(DateTime?)? onSubmitted;
  final DatePickerEntryMode initialEntryMode;
  final SelectableDayPredicate? selectableDayPredicate;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final Locale? locale;
  final RouteSettings? routeSettings;
  final TextDirection? textDirection;
  final TransitionBuilder? builder;
  final DatePickerMode initialDatePickerMode;
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHintText;
  final String? fieldLabelText;
  final TextInputType? keyboardType;
  final Offset? anchorPoint;
  final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange;
  final Icon? switchToInputEntryModeIcon;
  final Icon? switchToCalendarEntryModeIcon;

  const DatePickerConfig({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.onSubmitted,
    this.currentDate,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.selectableDayPredicate,
    this.helpText,
    this.cancelText = 'Cancel',
    this.confirmText = 'Done',
    this.locale,
    this.routeSettings,
    this.textDirection,
    this.builder,
    this.initialDatePickerMode = DatePickerMode.day,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.keyboardType,
    this.anchorPoint,
    this.onDatePickerModeChange,
    this.switchToInputEntryModeIcon,
    this.switchToCalendarEntryModeIcon,
  });

  Future<DateTime?> showDateDialog(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
        currentDate: currentDate,
        initialEntryMode: initialEntryMode,
        selectableDayPredicate: selectableDayPredicate,
        helpText: helpText,
        cancelText: cancelText,
        confirmText: confirmText,
        locale: locale,
        routeSettings: routeSettings,
        textDirection: textDirection,
        builder: builder,
        initialDatePickerMode: initialDatePickerMode,
        errorFormatText: errorFormatText,
        errorInvalidText: errorInvalidText,
        fieldHintText: fieldHintText,
        fieldLabelText: fieldLabelText,
        keyboardType: keyboardType,
        anchorPoint: anchorPoint,
        switchToCalendarEntryModeIcon: switchToCalendarEntryModeIcon,
        onDatePickerModeChange: onDatePickerModeChange,
        switchToInputEntryModeIcon: switchToCalendarEntryModeIcon,
      ).then((value) {
        if (onSubmitted != null) onSubmitted!(value);
        return value;
      });
}

class TimePickerConfig {
  final TimeOfDay initialTime;
  final TransitionBuilder? builder;
  final Function(TimeOfDay?)? onSubmitted;
  final TimePickerEntryMode initialEntryMode;
  final String? cancelText;
  final String? confirmText;
  final String? helpText;
  final String? errorInvalidText;
  final String? hourLabelText;
  final String? minuteLabelText;
  final RouteSettings? routeSettings;
  final EntryModeChangeCallback? onEntryModeChanged;
  final Offset? anchorPoint;
  final Orientation? orientation;
  TimePickerConfig({
    required this.initialTime,
    this.onSubmitted,
    this.builder,
    this.initialEntryMode = TimePickerEntryMode.dial,
    this.cancelText = 'Cancel',
    this.confirmText = 'Done',
    this.helpText,
    this.errorInvalidText,
    this.hourLabelText,
    this.minuteLabelText,
    this.routeSettings,
    this.onEntryModeChanged,
    this.anchorPoint,
    this.orientation,
  });

  Future<TimeOfDay?> showTimeDialog(BuildContext context) => showTimePicker(
        context: context,
        initialTime: initialTime,
        initialEntryMode: initialEntryMode,
        builder: builder,
        cancelText: cancelText,
        confirmText: confirmText,
        helpText: helpText,
        errorInvalidText: errorInvalidText,
        hourLabelText: hourLabelText,
        minuteLabelText: minuteLabelText,
        routeSettings: routeSettings,
        onEntryModeChanged: onEntryModeChanged,
        anchorPoint: anchorPoint,
        orientation: orientation,
      ).then((value) {
        if (onSubmitted != null) onSubmitted!(value);
        return value;
      });
}
