// ignore_for_file: file_names

import 'lang/datatimelang_fun.dart';
import '/core/src/extensions/library_extensions.dart';

class DateTimeFormat {
  final DateTime _dt;
  final String? _;
  final String lang;
  DateTimeFormat(DateTime dateTime, {String? seprator, this.lang = 'en'})
      : _ = seprator,
        _dt = dateTime,
        dtl = chooseDateTimeLang(lang);

  late final DateTimeLang dtl;

  /// ```dart
  /// yM() =>  10/2022
  /// ```
  String yM() => '${_dt.month}${_ ?? '/'}${_dt.year}';

  /// ```dart
  ///   yMd() => 10/30/2022
  /// ```
  String yMd() => '${_dt.day}${_ ?? '/'}${_dt.month}${_ ?? '/'}${_dt.year}';

  /// ```dart
  ///   yMEd()=> Sun, 10/30/2022
  ///   yMEd(isFull: true) => Sunday, 10/30/2022
  /// ```
  String yMEd({bool isFull = false}) {
    return '${isFull ? dtl.WEEKDAYS.LIST[_dt.weekday - 1] : dtl.SHORTWEEKDAYS.LIST[_dt.weekday - 1]}, '
        '${yMd()}';
  }

  /// ```dart
  ///   yMMM() => Oct 2022
  ///   yMMM(isFull: true) => October 2022
  /// ```
  String yMMM({bool isFull = false}) =>
      '${isFull ? dtl.MONTHS.LIST[_dt.month - 1] : dtl.SHORTMONTHS.LIST[_dt.month - 1]}${_ ?? ' '}'
      '${_dt.year}';

  /// ```dart
  ///   yMMMd() => Oct 30, 2022
  ///   yMMMd(isFull: true) => October 30, 2022
  /// ```
  String yMMMd({bool isFull = false}) =>
      '${isFull ? dtl.MONTHS.LIST[_dt.month - 1] : dtl.SHORTMONTHS.LIST[_dt.month - 1]} '
      '${_dt.day}${_ ?? ', '}'
      '${_dt.year}';

  /// ```dart
  ///   yMMMEd() => Sun, Oct 30, 2022
  ///   yMMMEd(isFull: true) =>Sunday, October 30, 2022
  /// ```
  String yMMMEd({bool isFull = false}) =>
      '${isFull ? dtl.WEEKDAYS.LIST[_dt.weekday - 1] : dtl.SHORTWEEKDAYS.LIST[_dt.weekday - 1]}${_ ?? ', '}'
      '${yMMMd(isFull: isFull)}';

  /// ```dart
  ///   yQQQ() => Q4 2022
  ///   yQQQ(isFull: true)=> 4th quarter 2022
  /// ```
  String yQQQ({bool isFull = false}) {
    return isFull
        ? '${_dt.quarter}${_ ?? ' '}'
            'quarter${_ ?? ' '}'
            '${_dt.year}'
        : 'Q${_dt.quarter}${_ ?? ' '}'
            '${_dt.year}';
  }

  /// ```dart
  /// hm() => 02:37
  /// hm() => 2:37 AM
  ///  /// ```
  String hm({bool showPeriod = false}) {
    return '${_dt.hour}${_ ?? ':'}'
            '${_dt.minute} '
            '${showPeriod ? '${_dt.period}' : ''}'
        .trim();
  }

  /// ```dart
  /// hms() => 02:37:31
  /// hms() => 2:37:31 AM
  /// ```
  hms({bool showPeriod = false}) {
    return '${_dt.hour}${_ ?? ':'}'
            '${_dt.minute}${_ ?? ':'}'
            '${_dt.second} '
            '${showPeriod ? '${_dt.period}' : ''}'
        .trim();
  }
}
