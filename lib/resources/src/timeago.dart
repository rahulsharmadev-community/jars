import 'package:jars/core/library_core.dart';
import 'lang/datatimelang_fun.dart';
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
  final String lang;

  Timeago(
    DateTime startAt,
    DateTime endAt, {
    this.lang = 'en',
    this.showSeconds = true,
    this.showMinutes = true,
    this.showHours = true,
    this.showDays = true,
    this.showWeeks = false,
    this.showMonths = true,
    this.showYears = true,
  })  : this.duration = endAt.difference(startAt),
        dtl = chooseDateTimeLang(lang);

  Timeago.since(DateTime since,
      {this.lang = 'en',
      this.showSeconds = true,
      this.showMinutes = true,
      this.showHours = true,
      this.showDays = true,
      this.showWeeks = false,
      this.showMonths = true,
      this.showYears = true})
      : this.duration = DateTime.now().difference(since),
        dtl = chooseDateTimeLang(lang);
  late final DateTimeLang dtl;
  format(
      {bool isFull = false,
      String? seprator,
      String Function(DateTimeFormat)? monthFormat,
      String Function(DateTimeFormat)? yearFormat}) {
    if (showYears && duration.inYears > 0)
      return (yearFormat == null)
          ? '${duration.inYears} ${isFull ? dtl.YEARS : dtl.SHORTYEARS} ${dtl.TIMEAGESUFFIX}'
          : yearFormat(DateTimeFormat(DateTime.now().subtract(duration),
              seprator: seprator, lang: lang));
    else if (showMonths && duration.inMonths > 0)
      return (monthFormat == null)
          ? '${duration.inMonths} ${isFull ? dtl.MONTHS.NAME : dtl.SHORTMONTHS.NAME} ${dtl.TIMEAGESUFFIX}'
          : monthFormat(DateTimeFormat(DateTime.now().subtract(duration),
              seprator: seprator, lang: lang));
    else if (showWeeks && duration.inWeeks > 0)
      return '${duration.inWeeks} ${isFull ? dtl.WEEKDAYS.NAME : dtl.SHORTWEEKDAYS.NAME} ${dtl.TIMEAGESUFFIX}';
    else if (showDays && duration.inDays > 0)
      return '${duration.inDays} ${isFull ? dtl.DAYS : dtl.SHORTDAYS} ${dtl.TIMEAGESUFFIX}';
    else if (showHours && duration.inHours > 0)
      return '${duration.inHours} ${isFull ? dtl.HOURS : dtl.SHORTHOURS} ${dtl.TIMEAGESUFFIX}';
    else if (showMinutes && duration.inMinutes > 0)
      return '${duration.inMinutes} ${isFull ? dtl.MINUTES : dtl.SHORTMINUTES} ${dtl.TIMEAGESUFFIX}';
    else if (showSeconds && duration.inSeconds > 10)
      return '${duration.inSeconds} ${isFull ? dtl.SECONDS : dtl.SHORTSECONDS} ${dtl.TIMEAGESUFFIX}';
    else
      return dtl.JUSTNOW;
  }

// Pending
  //  just now
  //  30s ago
  //  30m ago
  //  4h ago
  //  6d ago
  //  4w ago
  //  9mo ago
  //  5yr ago
  // Convert into local language

}
