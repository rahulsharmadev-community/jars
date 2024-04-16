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
    double result = (n / curr.divisor).toPrecision(fractionDigits);

    var str = simple(
      result,
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
    prefix = prefix + (currencySymbol ? this.currencySymbol : '');

    if (n is int && n < 999) return prefix + toString();

    RegExp readable = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    mathFunc(Match match) => '${match[1]}$separator';

    if (n is int) return prefix + toString().replaceAllMapped(readable, mathFunc);

    var str = trimZero
        ? (n as double).toPrecision(fractionDigits).toString().split('.')
        : (n as double).toPrecision(fractionDigits).toStringAsFixed(fractionDigits).split('.');

    var strfrac = str[1] == '0' ? '' : '.${str[1]}';
    return fractionDigits < 3
        ? '$prefix${str[0].replaceAllMapped(readable, mathFunc)}$strfrac'
        : prefix + str.map((e) => e.replaceAllMapped(readable, mathFunc)).join('.');
  }
}
