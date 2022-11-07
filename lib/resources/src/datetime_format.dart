// ignore_for_file: file_names
import '../../core/src/extensions/library_extensions.dart';

class DateTimeFormat {
  final DateTime dt;
  final String? _;
  const DateTimeFormat(DateTime dateTime, {String? seprator})
      : _ = seprator,
        dt = dateTime;

  /// yM() =>  10/2022
  yM() => '${dt.month}${_ ?? '/'}${dt.year}';

  /// ```dart
  ///   yMd() => 10/30/2022
  /// ```
  yMd() => '${dt.day}${_ ?? '/'}${dt.month}${_ ?? '/'}${dt.year}';

  /// ```dart
  ///   yMEd()=> Sun, 10/30/2022
  ///   yMEd(isFull: true) => Sunday, 10/30/2022
  /// ```
  yMEd({bool isFull = false}) {
    return '${Weeks.values[dt.day].name.substring(0, isFull ? null : 4).onlyfirstUppercase}, '
        '${yMd()}';
  }

  /// ```dart
  ///   yMMM() => Oct 2022
  ///   yMMM(isFull: true) => October 2022
  /// ```
  yMMM({bool isFull = false}) =>
      '${Month.values[dt.month].name.substring(0, isFull ? null : 4).onlyfirstUppercase}${_ ?? ' '}'
      '${dt.year}';

  /// ```dart
  ///   yMMMd() => Oct 30, 2022
  ///   yMMMd(isFull: true) => October 30, 2022
  /// ```
  yMMMd({bool isFull = false}) =>
      '${Month.values[dt.month].name.substring(0, isFull ? null : 4).onlyfirstUppercase} '
      '${dt.day}${_ ?? ', '}'
      '${dt.year}';

  /// ```dart
  ///   yMMMEd() => Sun, Oct 30, 2022
  ///   yMMMEd(isFull: true) =>Sunday, October 30, 2022
  /// ```
  yMMMEd({bool isFull = false}) {
    return '${Weeks.values[dt.day].name.substring(0, isFull ? null : 4).onlyfirstUppercase}${_ ?? ', '}'
        '${yMMMd(isFull: isFull)}';
  }

  /// ```dart
  ///   yQQQ() => Q4 2022
  ///   yQQQ(isFull: true)=> 4th quarter 2022
  /// ```
  yQQQ({bool isFull = false}) {
    return isFull
        ? '${dt.quarter}${_ ?? ' '}'
            'quarter${_ ?? ' '}'
            '${dt.year}'
        : 'Q${dt.quarter}${_ ?? ' '}'
            '${dt.year}';
  }

  /// ```dart
  /// hm() => 02:37
  /// hm() => 2:37 AM
  ///  /// ```
  hm({bool showPeriod = false}) {
    return '${dt.hour}${_ ?? ':'}'
            '${dt.minute} '
            '${showPeriod ? '${dt.period}' : ''}'
        .trim();
  }

  /// ```dart
  /// hms() => 02:37:31
  /// hms() => 2:37:31 AM
  /// ```
  hms({bool showPeriod = false}) {
    return '${dt.hour}${_ ?? ':'}'
            '${dt.minute}${_ ?? ':'}'
            '${dt.second} '
            '${showPeriod ? '${dt.period}' : ''}'
        .trim();
  }
}

enum Weeks {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
  daysPerWeek
}

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
  monthsPerYear
}
