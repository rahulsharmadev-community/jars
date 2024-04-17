part of 'number_format.dart';

extension NumberFormatExt on NumberFormat {
  String compact(
    num n, {
    bool currencySymbol = false,
    bool trimZero = false,
    String separator = ',',
    String prefix = '',
    bool shortfrom = true,
  }) {
    if (n.isInfiniteOrNuN) return 'Infinite or NuN';
    FormatMetaData curr = metaData.firstWhere((e) => (n / e.divisor) < 1000, orElse: () => metaData.last);
    var str = simple(
      (n / curr.divisor),
      currencySymbol: currencySymbol,
      fractionDigits: fractionDigits,
      prefix: prefix,
      trimZero: trimZero,
      separator: separator,
    );
    return '$str${shortfrom ? curr.suffixAbbreviation : ' ${curr.suffix}'}';
  }

  String simple(
    num n, {
    String prefix = '',
    bool trimZero = false,
    bool currencySymbol = false,
    String separator = ',',
    int fractionDigits = 2,
  }) {
    String minus = n.isNegative ? '-' : '';
    prefix = prefix + minus + (currencySymbol ? this.currencySymbol : '');

    n = n.abs().toRoundPrecision(fractionDigits);
    var str = trimZero ? n.toString().split('.') : n.toStringAsFixed(fractionDigits).split('.');
    var strfrac = (str.length == 1 || (str[1] == '0' && trimZero)) ? '' : '.${str[1]}';
    return '$prefix${str[0].separate(separator: separator)}$strfrac';
  }
}
