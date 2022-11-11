import 'dart:async';
import 'data_reader.dart';
import 'model.dart';

class DateTimeLang {
  DateTimeLang._();

  static final _availableLang = <DateTimeLangModel>[
    DateTimeLangModel(
      CODE: "hi",
      JUSTNOW: "हाल ही में",
      TIMEAGESUFFIX: "पूर्व",
      YEARS: "वर्षों",
      DAYS: "दिन",
      HOURS: "घंटे",
      MINUTES: "मिनट",
      SECONDS: "सेकंड",
      SHORTYEARS: "वर्षों",
      SHORTDAYS: "दिन",
      SHORTHOURS: "घंटे",
      SHORTMINUTES: "मिनट",
      SHORTSECONDS: "सेकंड",
      MONTHS: MetaData(NAME: "महीने", LIST: [
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
      SHORTMONTHS: MetaData(NAME: "महीने", LIST: [
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
      WEEKDAYS: MetaData(NAME: "सप्ताह", LIST: [
        "रविवार",
        "सोमवार",
        "मंगलवार",
        "बुधवार",
        "गुरुवार",
        "शुक्रवार",
        "शनिवार"
      ]),
      SHORTWEEKDAYS: MetaData(
          NAME: "सप्ताह",
          LIST: ["रवि", "सोम", "मंगल", "बुध", "गुरु", "शुक्र", "शनि"]),
    ),
    DateTimeLangModel(
      CODE: "en",
      JUSTNOW: "Just now",
      TIMEAGESUFFIX: "ago",
      YEARS: "Years",
      DAYS: "Days",
      HOURS: "Hours",
      MINUTES: "Minutes",
      SECONDS: "Seconds",
      SHORTYEARS: "Yr",
      SHORTDAYS: "D",
      SHORTHOURS: "Hr",
      SHORTMINUTES: "Min",
      SHORTSECONDS: "Sec",
      MONTHS: MetaData(NAME: "Months", LIST: [
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
      SHORTMONTHS: MetaData(NAME: "Mo", LIST: [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sept",
        "Oct",
        "Nov",
        "Dec"
      ]),
      WEEKDAYS: MetaData(NAME: "Weeks", LIST: [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
      ]),
      SHORTWEEKDAYS: MetaData(
          NAME: "w", LIST: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]),
    )
  ];

  static String _defaultLang = 'en';
  static setDefaultLang(String CODE) => _defaultLang = CODE;

  static DateTimeLangModel dateTimeLang([String? langCode]) =>
      _availableLang.firstWhere(
        (element) => element.CODE == (langCode ?? _defaultLang),
        orElse: () => _availableLang[1],
      );

  static FutureOr<void> loadFromFile(
      {required String CODE, required String path}) async {
    try {
      var response = await FileRequestDataReader(path).read();
      _availableLang.add(DateTimeLangModel.fromJson(response));
    } on Exception catch (e) {
      throw '$e';
    }
  }

  /// Under the hood, **English & Hindi** are already available.
  ///
  /// Chinese (zh-CN): https://datetimelangs-default-rtdb.asia-southeast1.firebasedatabase.app/zh-CH.json
  ///
  /// French (fr): https://datetimelangs-default-rtdb.asia-southeast1.firebasedatabase.app/fr.json
  ///
  /// Afrikaans (af): https://datetimelangs-default-rtdb.asia-southeast1.firebasedatabase.app/af.json
  static FutureOr<void> loadFromUrl(
      {required String CODE, required String url}) async {
    try {
      var response = await HttpRequestDataReader(url).read();
      _availableLang.add(DateTimeLangModel.fromJson(response));
    } on Exception catch (e) {
      throw '$e';
    }
  }
}
