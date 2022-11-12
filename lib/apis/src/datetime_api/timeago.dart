import 'package:jars/core/library_core.dart';
import 'datetimelang_fun.dart';
import 'datetime_format.dart';

class Timeago {
  final Duration duration;
  final bool showSeconds,
      showMinutes,
      showHours,
      showDays,
      showWeeks,
      showMonths,
      showYears;
  final String? code;

  Timeago(
    DateTime startAt,
    DateTime endAt, {
    this.code,
    this.showSeconds = true,
    this.showMinutes = true,
    this.showHours = true,
    this.showDays = true,
    this.showWeeks = false,
    this.showMonths = true,
    this.showYears = true,
  }) : this.duration = endAt.difference(startAt);

  Timeago.since(DateTime since,
      {this.code,
      this.showSeconds = true,
      this.showMinutes = true,
      this.showHours = true,
      this.showDays = true,
      this.showWeeks = false,
      this.showMonths = true,
      this.showYears = true})
      : this.duration = DateTime.now().difference(since);

  Timeago.fromDuration(this.duration,
      {this.code,
      this.showSeconds = true,
      this.showMinutes = true,
      this.showHours = true,
      this.showDays = true,
      this.showWeeks = false,
      this.showMonths = true,
      this.showYears = true});

  format(
      {bool isFull = false,
      String? seprator,
      String Function(DateTimeFormat)? monthFormat,
      String Function(DateTimeFormat)? yearFormat}) {
    var dtl = DateTimeLang.dateTimeLang(code);

    if (showYears && duration.inYears > 0) {
      return (yearFormat == null)
          ? '${duration.inYears} ${isFull ? dtl.YEARS : dtl.SHORTYEARS} ${dtl.TIMEAGESUFFIX}'
          : yearFormat(DateTimeFormat(DateTime.now().subtract(duration),
              seprator: seprator, code: code));
    } else if (showMonths && duration.inMonths > 0) {
      return (monthFormat == null)
          ? '${duration.inMonths} ${isFull ? dtl.MONTHS.NAME : dtl.SHORTMONTHS.NAME} ${dtl.TIMEAGESUFFIX}'
          : monthFormat(DateTimeFormat(DateTime.now().subtract(duration),
              seprator: seprator, code: code));
    } else if (showWeeks && duration.inWeeks > 0) {
      return '${duration.inWeeks} ${isFull ? dtl.WEEKDAYS.NAME : dtl.SHORTWEEKDAYS.NAME} ${dtl.TIMEAGESUFFIX}';
    } else if (showDays && duration.inDays > 0) {
      return '${duration.inDays} ${isFull ? dtl.DAYS : dtl.SHORTDAYS} ${dtl.TIMEAGESUFFIX}';
    } else if (showHours && duration.inHours > 0) {
      return '${duration.inHours} ${isFull ? dtl.HOURS : dtl.SHORTHOURS} ${dtl.TIMEAGESUFFIX}';
    } else if (showMinutes && duration.inMinutes > 0) {
      return '${duration.inMinutes} ${isFull ? dtl.MINUTES : dtl.SHORTMINUTES} ${dtl.TIMEAGESUFFIX}';
    } else if (showSeconds && duration.inSeconds > 10) {
      return '${duration.inSeconds} ${isFull ? dtl.SECONDS : dtl.SHORTSECONDS} ${dtl.TIMEAGESUFFIX}';
    } else {
      return dtl.JUSTNOW;
    }
  }
}
