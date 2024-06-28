// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:jars_core/jars_core.dart';

part 'number_format_ext.dart';

class FormatMetaData {
  final num exponent;
  final String suffixAbbreviation;
  final String suffix;

  num get divisor => pow(10, exponent);
  const FormatMetaData({
    required this.exponent,
    required this.suffixAbbreviation,
    required this.suffix,
  });

  // Convert FormatMetaData instance to JSON
  JSON toJson() {
    return {
      'exponent': exponent,
      'suffixAbbreviation': suffixAbbreviation,
      'suffix': suffix,
    };
  }

  // Create FormatMetaData instance from JSON
  factory FormatMetaData.fromJson(JSON json) {
    return FormatMetaData(
      exponent: json['exponent'],
      suffixAbbreviation: json['suffixAbbreviation'],
      suffix: json['suffix'],
    );
  }
}

class NumberFormat {
  final String currencyCode;
  final String currencySymbol;
  final int fractionDigits;
  final List<FormatMetaData> metaData;
  NumberFormat({
    required this.currencyCode,
    required this.currencySymbol,
    required this.metaData,
    this.fractionDigits = 2,
  });
  // Implement copyWith method
  NumberFormat copyWith({
    String? currencyCode,
    String? currencySymbol,
    int? fractionDigits,
    List<FormatMetaData>? metaData,
  }) {
    return NumberFormat(
      currencyCode: currencyCode ?? this.currencyCode,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      fractionDigits: fractionDigits ?? this.fractionDigits,
      metaData: metaData ?? this.metaData,
    );
  }

  // Convert NumberFormat instance to JSON
  JSON toJson() {
    return {
      'currencyCode': currencyCode,
      'currencySymbol': currencySymbol,
      'fractionDigits': fractionDigits,
      'metaData': metaData.map((meta) => meta.toJson()).toList(),
    };
  }

  // Create NumberFormat instance from JSON
  factory NumberFormat.fromJson(JSON json) {
    return NumberFormat(
      currencyCode: json['currencyCode'],
      currencySymbol: json['currencySymbol'],
      fractionDigits: json['fractionDigits'],
      metaData: (json['metaData'] as List<dynamic>).map((metaJson) {
        return FormatMetaData.fromJson(metaJson);
      }).toList(),
    );
  }

  const NumberFormat.en()
      : currencyCode = 'USD',
        currencySymbol = '\u0024',
        fractionDigits = 2,
        metaData = const [
          FormatMetaData(exponent: 0, suffixAbbreviation: '', suffix: ''),
          FormatMetaData(exponent: 3, suffixAbbreviation: 'K', suffix: 'Thousand'),
          FormatMetaData(exponent: 6, suffixAbbreviation: 'M', suffix: 'Million'),
          FormatMetaData(exponent: 9, suffixAbbreviation: 'B', suffix: 'Billion'),
          FormatMetaData(exponent: 12, suffixAbbreviation: 'T', suffix: 'Trillion'),
          FormatMetaData(exponent: 15, suffixAbbreviation: 'Q', suffix: 'Quadrillion'),
        ];

  const NumberFormat.en_in()
      : currencyCode = 'INR',
        currencySymbol = '\u20B9',
        fractionDigits = 2,
        metaData = const [
          FormatMetaData(exponent: 0, suffixAbbreviation: '', suffix: ''),
          FormatMetaData(exponent: 3, suffixAbbreviation: 'K', suffix: 'Thousand'),
          FormatMetaData(exponent: 5, suffixAbbreviation: 'L', suffix: 'Lakh'),
          FormatMetaData(exponent: 7, suffixAbbreviation: 'Cr', suffix: 'Crore '),
          FormatMetaData(exponent: 10, suffixAbbreviation: 'KCr', suffix: 'Thousand Crore'),
          FormatMetaData(exponent: 12, suffixAbbreviation: 'LCr', suffix: 'Lakh Crore'),
          FormatMetaData(exponent: 15, suffixAbbreviation: 'KLCr', suffix: 'Thousand Lakh Crore'),
        ];
  const NumberFormat.hi()
      : currencyCode = 'INR',
        currencySymbol = '\u20B9',
        fractionDigits = 2,
        metaData = const [
          FormatMetaData(exponent: 0, suffixAbbreviation: '', suffix: ''),
          FormatMetaData(exponent: 3, suffixAbbreviation: 'हज़ार', suffix: 'हज़ार'),
          FormatMetaData(exponent: 5, suffixAbbreviation: 'लाख', suffix: 'लाख'),
          FormatMetaData(exponent: 7, suffixAbbreviation: 'करोड़', suffix: 'करोड़'),
          FormatMetaData(exponent: 9, suffixAbbreviation: 'अरब', suffix: 'अरब'),
          FormatMetaData(exponent: 12, suffixAbbreviation: 'खरब', suffix: 'खरब'),
          FormatMetaData(exponent: 15, suffixAbbreviation: 'खरब', suffix: 'हज़ार खरब'),
        ];

  const NumberFormat.fr()
      : currencyCode = 'EUR',
        currencySymbol = '\u20AC',
        fractionDigits = 2,
        metaData = const [
          FormatMetaData(exponent: 0, suffixAbbreviation: '', suffix: ''),
          FormatMetaData(exponent: 3, suffixAbbreviation: 'k', suffix: 'Mille'),
          FormatMetaData(exponent: 6, suffixAbbreviation: 'M', suffix: 'Million'),
          FormatMetaData(exponent: 9, suffixAbbreviation: 'Md', suffix: 'Milliard'),
          FormatMetaData(exponent: 12, suffixAbbreviation: 'Bn', suffix: 'Billion'),
          FormatMetaData(exponent: 15, suffixAbbreviation: 'Bd', suffix: 'Billiard'),
        ];

  const NumberFormat.de()
      : currencyCode = 'EUR',
        currencySymbol = '\u20AC',
        fractionDigits = 2,
        metaData = const [
          FormatMetaData(exponent: 0, suffixAbbreviation: '', suffix: ''),
          FormatMetaData(exponent: 3, suffixAbbreviation: 'Tsd', suffix: 'Tausend'),
          FormatMetaData(exponent: 6, suffixAbbreviation: 'Mio', suffix: 'Million'),
          FormatMetaData(exponent: 9, suffixAbbreviation: 'Mrd', suffix: 'Milliarde'),
          FormatMetaData(exponent: 12, suffixAbbreviation: 'Bio', suffix: 'Billion'),
          FormatMetaData(exponent: 15, suffixAbbreviation: 'Brd', suffix: 'Billiarde'),
        ];
}
