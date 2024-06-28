// ignore_for_file: file_names

import 'package:jars_core/src/extensions/src/datetime_extensions.dart';
import 'package:jars_core/src/utility/src/datetimelang/datetimelang.dart';

class DateTimeFormat {
  final DateTime _dt;
  final String? _;
  final DateTimeLang? lang;
  final DateTimeLangModel _model;
  DateTimeFormat(DateTime dateTime, {String? seprator, this.lang})
      : _ = seprator,
        _dt = dateTime,
        _model = DateTimeLang.dateTimeLang(lang);

  String month({bool isFull = false}) =>
      isFull ? _model.months.LIST[_dt.month - 1] : _model.shortmonths.LIST[_dt.month - 1];

  String weekday({bool isFull = false}) =>
      isFull ? _model.weekdays.LIST[_dt.weekday - 1] : _model.shortweekdays.LIST[_dt.weekday - 1];

  /// ```dart
  /// yM() =>  10/2022
  /// ```
  String yM() => '${_dt.month}${_ ?? '/'}${_dt.year}';

  /// ```dart
  ///   yMd() => 10/30/2022
  /// ```
  String yMd() => '${_dt.day}${_ ?? '/'}${yM()}';

  /// ```dart
  ///   yMEd()=> Sun, 10/30/2022
  ///   yMEd(isFull: true) => Sunday, 10/30/2022
  /// ```
  String yMEd({bool isFull = false}) {
    return '${weekday(isFull: isFull)}, ${yMd()}';
  }

  /// ```dart
  ///   yMMM() => Oct 2022
  ///   yMMM(isFull: true) => October 2022
  /// ```
  String yMMM({bool isFull = false}) => '${month(isFull: isFull)}${_ ?? ' '}${_dt.year}';

  /// ```dart
  ///   yMMd() => 30 Oct 2022
  ///   yMMd(isFull: true) => 30 October 2022
  /// ```
  String yMMd({bool isFull = false}) => '${_dt.day}${_ ?? ' '}${month(isFull: isFull)}${_ ?? ' '}${_dt.year}';

  /// ```dart
  ///   yMMMd() => Oct 30, 2022
  ///   yMMMd(isFull: true) => October 30, 2022
  /// ```
  String yMMMd({bool isFull = false}) => '${month(isFull: isFull)} ${_dt.day}${_ ?? ', '}${_dt.year}';

  /// ```dart
  ///   yMMMEd() => Sun, Oct 30, 2022
  ///   yMMMEd(isFull: true) =>Sunday, October 30, 2022
  /// ```
  String yMMMEd({bool isFull = false}) => '${weekday(isFull: isFull)}${_ ?? ', '}'
      '${yMMMd(isFull: isFull)}';

  /// ```dart
  ///   yQQQ() => Q4 2022
  ///   yQQQ(isFull: true)=> 4th quarter 2022
  /// ```
  String yQQQ({bool isFull = false}) =>
      isFull ? '${_dt.quarter}${_ ?? ' '}quarter${_ ?? ' '}${_dt.year}' : 'Q${_dt.quarter}${_ ?? ' '}${_dt.year}';

  /// ```dart
  /// hm() => 02:37
  /// hm() => 2:37 AM
  ///  /// ```
  String hm({bool showPeriod = false}) =>
      '${_dt.hour}${_ ?? ':'}${_dt.minute} ${showPeriod ? _dt.period.name : ''}'.trim();

  /// ```dart
  /// hms() => 02:37:31
  /// hms() => 2:37:31 AM
  /// ```
  hms({bool showPeriod = false}) =>
      '${_dt.hour}${_ ?? ':'}${_dt.minute}${_ ?? ':'}${_dt.second} ${showPeriod ? _dt.period.name : ''}'.trim();

  /// ```dart
  ///   yMMd() => 30 Oct 2022, 2:37
  ///   yMMd(isFull: true) => 30 October 2022, 2:37 AM
  /// ```
  String yMMdhm({bool isFull = false}) => '${_dt.day}${_ ?? ' '}'
      '${month(isFull: isFull)}${_ ?? ' '}'
      '${_dt.year}${_ ?? ', '}${hm(showPeriod: isFull)}';

  /// ```dart
  ///   yMMd() => 30 Oct 2022, 2:37:31
  ///   yMMd(isFull: true) => 30 October 2022, 2:37:31 AM
  /// ```
  String yMMdhms({bool isFull = false}) => '${_dt.day}${_ ?? ' '}'
      '${month(isFull: isFull)}${_ ?? ' '}'
      '${_dt.year}${_ ?? ', '}${hms(showPeriod: isFull)}';
}
