import 'dart:convert';

part 'datetimelang_model.dart';

enum DateTimeLang {
  /// Hindi
  hi(
    model: DateTimeLangModel(
      code: "hi",
      justnow: "हाल ही में",
      timeagosuffix: "पूर्व",
      years: "वर्षों",
      days: "दिन",
      hours: "घंटे",
      minutes: "मिनट",
      seconds: "सेकंड",
      shortyears: "वर्षों",
      shortdays: "दिन",
      shorthours: "घंटे",
      shortminutes: "मिनट",
      shortseconds: "सेकंड",
      months: DateTimeLangMetaData(NAME: "महीने", LIST: [
        "जनवरी",
        "फ़रवरी",
        "मार्च",
        "अप्रैल",
        "मई",
        "जून",
        "जुलाई",
        "अगस्त",
        "सितंबर",
        "अक्तूबर",
        "नवंबर",
        "दिसंबर"
      ]),
      shortmonths: DateTimeLangMetaData(NAME: "महीने", LIST: [
        "जन॰",
        "फ़र॰",
        "मार्च",
        "अप्रैल",
        "मई",
        "जून",
        "जुल॰",
        "अग॰",
        "सित॰",
        "अक्तू॰",
        "नव॰",
        "दिस॰"
      ]),
      weekdays: DateTimeLangMetaData(
          NAME: "सप्ताह", LIST: ["रविवार", "सोमवार", "मंगलवार", "बुधवार", "गुरुवार", "शुक्रवार", "शनिवार"]),
      shortweekdays:
          DateTimeLangMetaData(NAME: "सप्ताह", LIST: ["रवि", "सोम", "मंगल", "बुध", "गुरु", "शुक्र", "शनि"]),
    ),
  ),

  /// English
  en(
      model: DateTimeLangModel(
    code: "en",
    justnow: "Just now",
    timeagosuffix: "ago",
    years: "Years",
    days: "Days",
    hours: "Hours",
    minutes: "Minutes",
    seconds: "Seconds",
    shortyears: "Yr",
    shortdays: "D",
    shorthours: "Hr",
    shortminutes: "Min",
    shortseconds: "Sec",
    months: DateTimeLangMetaData(NAME: "Months", LIST: [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ]),
    shortmonths: DateTimeLangMetaData(
        NAME: "Mo",
        LIST: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]),
    weekdays: DateTimeLangMetaData(
        NAME: "Weeks", LIST: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]),
    shortweekdays: DateTimeLangMetaData(NAME: "w", LIST: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]),
  ));

  final DateTimeLangModel model;
  const DateTimeLang({required this.model});

  static DateTimeLang defaultLang = DateTimeLang.en;

  static DateTimeLangModel dateTimeLang([DateTimeLang? lang]) => lang?.model ?? defaultLang.model;

  @override
  String toString() => name;
}
