part of 'datatimelang_fun.dart';

class DateTimeLang {
  const DateTimeLang({
    required this.LANG,
    required this.JUSTNOW,
    required this.TIMEAGESUFFIX,
    required this.MONTHS,
    required this.SHORTMONTHS,
    required this.WEEKDAYS,
    required this.SHORTWEEKDAYS,
    required this.YEARS,
    required this.DAYS,
    required this.HOURS,
    required this.MINUTES,
    required this.SECONDS,
    required this.SHORTYEARS,
    required this.SHORTDAYS,
    required this.SHORTHOURS,
    required this.SHORTMINUTES,
    required this.SHORTSECONDS,
  });

  final String LANG;
  final String JUSTNOW;
  final String TIMEAGESUFFIX;
  final MetaData MONTHS;
  final MetaData SHORTMONTHS;
  final MetaData WEEKDAYS;
  final MetaData SHORTWEEKDAYS;
  final String YEARS;
  final String DAYS;
  final String HOURS;
  final String MINUTES;
  final String SECONDS;
  final String SHORTYEARS;
  final String SHORTDAYS;
  final String SHORTHOURS;
  final String SHORTMINUTES;
  final String SHORTSECONDS;

  factory DateTimeLang.fromJson(String str) =>
      DateTimeLang.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DateTimeLang.fromMap(Map<String, dynamic> map) => DateTimeLang(
        LANG: map["LANG"],
        JUSTNOW: map["JUSTNOW"],
        TIMEAGESUFFIX: map["TIMEAGESUFFIX"],
        MONTHS: MetaData.fromMap(map["MONTHS"]),
        SHORTMONTHS: MetaData.fromMap(map["SHORTMONTHS"]),
        WEEKDAYS: MetaData.fromMap(map["WEEKDAYS"]),
        SHORTWEEKDAYS: MetaData.fromMap(map["SHORTWEEKDAYS"]),
        YEARS: map["YEARS"],
        DAYS: map["DAYS"],
        HOURS: map["HOURS"],
        MINUTES: map["MINUTES"],
        SECONDS: map["SECONDS"],
        SHORTYEARS: map["SHORTYEARS"],
        SHORTDAYS: map["SHORTDAYS"],
        SHORTHOURS: map["SHORTHOURS"],
        SHORTMINUTES: map["SHORTMINUTES"],
        SHORTSECONDS: map["SHORTSECONDS"],
      );

  Map<String, dynamic> toMap() => {
        "LANG": LANG,
        "JUSTNOW": JUSTNOW,
        "TIMEAGESUFFIX": TIMEAGESUFFIX,
        "MONTHS": MONTHS.toMap(),
        "SHORTMONTHS": SHORTMONTHS.toMap(),
        "WEEKDAYS": WEEKDAYS.toMap(),
        "SHORTWEEKDAYS": SHORTWEEKDAYS.toMap(),
        "YEARS": YEARS,
        "DAYS": DAYS,
        "HOURS": HOURS,
        "MINUTES": MINUTES,
        "SECONDS": SECONDS,
        "SHORTYEARS": SHORTYEARS,
        "SHORTDAYS": SHORTDAYS,
        "SHORTHOURS": SHORTHOURS,
        "SHORTMINUTES": SHORTMINUTES,
        "SHORTSECONDS": SHORTSECONDS,
      };
}

class MetaData {
  MetaData({
    required this.NAME,
    required this.LIST,
  });

  final String NAME;
  final List<String> LIST;

  factory MetaData.fromJson(String str) => MetaData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetaData.fromMap(Map<String, dynamic> map) => MetaData(
        NAME: map["NAME"],
        LIST: List<String>.from(map["LIST"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "NAME": NAME,
        "LIST": List<dynamic>.from(LIST.map((x) => x)),
      };
}
