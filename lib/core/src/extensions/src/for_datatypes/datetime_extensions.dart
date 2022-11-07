import '/resources/src/datetime_format.dart';
import 'package:flutter/material.dart' show TimeOfDay, DayPeriod;

extension DateTimeExtensions on DateTime {
  TimeOfDay get timeOfDay => TimeOfDay.fromDateTime(this);

  /// Whether this time of day is before or after noon.
  DayPeriod get period => hour < hoursPerPeriod ? DayPeriod.am : DayPeriod.pm;

  /// Which hour of the current period (e.g., am or pm) this time is.
  ///
  /// For 12AM (midnight) and 12PM (noon) this returns 12.
  int get hourOfPeriod => hour == 0 || hour == 12 ? 12 : hour - periodOffset;

  /// The hour at which the current period starts.
  int get periodOffset => period == DayPeriod.am ? 0 : hoursPerPeriod;

  /// The number of hours in one day period (see also [DayPeriod]), i.e. 12.
  int get hoursPerPeriod => 12;

  int get quarter => (month / 4).round();

  /// Sample
  /// ```dart
  ///
  /// ```
  DateTimeFormat format([String? seprator]) =>
      DateTimeFormat(this, seprator: seprator);
}
