import 'dart:convert';
part '_datetimelang.dart';

DateTimeLang chooseDateTimeLang(String ext) {
  switch (ext) {
    case 'hi':
      return DateTimeLang(
        LANG: "hi",
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
      );
    default:
      return DateTimeLang(
        LANG: "en",
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
      );
  }
}
