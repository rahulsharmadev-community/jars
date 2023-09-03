// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class DateTimeLangModel {
  const DateTimeLangModel({
    required this.code,
    required this.justnow,
    required this.timeagosuffix,
    required this.months,
    required this.shortmonths,
    required this.weekdays,
    required this.shortweekdays,
    required this.years,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.shortyears,
    required this.shortdays,
    required this.shorthours,
    required this.shortminutes,
    required this.shortseconds,
  });

  final String code;
  final String justnow;
  final String timeagosuffix;
  final DateTimeLangMetaData months;
  final DateTimeLangMetaData shortmonths;
  final DateTimeLangMetaData weekdays;
  final DateTimeLangMetaData shortweekdays;
  final String years;
  final String days;
  final String hours;
  final String minutes;
  final String seconds;
  final String shortyears;
  final String shortdays;
  final String shorthours;
  final String shortminutes;
  final String shortseconds;

  factory DateTimeLangModel.fromJson(String str) =>
      DateTimeLangModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DateTimeLangModel.fromMap(Map<String, dynamic> map) =>
      DateTimeLangModel(
        code: map["CODE"],
        justnow: map["JUSTNOW"],
        timeagosuffix: map["TIMEAGOSUFFIX"],
        months: DateTimeLangMetaData.fromMap(map["MONTHS"]),
        shortmonths: DateTimeLangMetaData.fromMap(map["SHORTMONTHS"]),
        weekdays: DateTimeLangMetaData.fromMap(map["WEEKDAYS"]),
        shortweekdays: DateTimeLangMetaData.fromMap(map["SHORTWEEKDAYS"]),
        years: map["YEARS"],
        days: map["DAYS"],
        hours: map["HOURS"],
        minutes: map["MINUTES"],
        seconds: map["SECONDS"],
        shortyears: map["SHORTYEARS"],
        shortdays: map["SHORTDAYS"],
        shorthours: map["SHORTHOURS"],
        shortminutes: map["SHORTMINUTES"],
        shortseconds: map["SHORTSECONDS"],
      );

  Map<String, dynamic> toMap() => {
        "CODE": code,
        "JUSTNOW": justnow,
        "TIMEAGOSUFFIX": timeagosuffix,
        "MONTHS": months.toMap(),
        "SHORTMONTHS": shortmonths.toMap(),
        "WEEKDAYS": weekdays.toMap(),
        "SHORTWEEKDAYS": shortweekdays.toMap(),
        "YEARS": years,
        "DAYS": days,
        "HOURS": hours,
        "MINUTES": minutes,
        "SECONDS": seconds,
        "SHORTYEARS": shortyears,
        "SHORTDAYS": shortdays,
        "SHORTHOURS": shorthours,
        "SHORTMINUTES": shortminutes,
        "SHORTSECONDS": shortseconds,
      };
}

class DateTimeLangMetaData {
  const DateTimeLangMetaData({
    required this.NAME,
    required this.LIST,
  });

  final String NAME;

  ///Must be in sequece
  final List<String> LIST;

  factory DateTimeLangMetaData.fromJson(String str) =>
      DateTimeLangMetaData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DateTimeLangMetaData.fromMap(Map<String, dynamic> map) =>
      DateTimeLangMetaData(
        NAME: map["NAME"],
        LIST: List<String>.from(map["LIST"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "NAME": NAME,
        "LIST": List<dynamic>.from(LIST.map((x) => x)),
      };
}
