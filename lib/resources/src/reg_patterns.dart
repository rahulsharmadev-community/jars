import '../../core/src/extensions/library_extensions.dart';

class RegPatterns {
  RegPatterns._();

  /// Checks if string consist only numeric.
  /// Numeric only doesn't accepting "." which double data type have
  static final isNumericOnly = r'^\d+$'.regPattern;

  /// Checks if string consist only Alphabet. (No Whitespace)
  static final isAlphabetOnly = r'^[a-zA-Z]+$'.regPattern;

  /// Checks if string contains at least one Capital Letter
  static final hasCapitalletter = r'[A-Z]'.regPattern;

  /// Checks if string is a valid username.
  static final isUsername =
      r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$'.regPattern;

  /// Checks if string is Passport No.
  static final isPassport = r'^(?!^0+$)[a-zA-Z0-9]{6,9}$'.regPattern;

  /// Checks if string is Currency.
  static final isCurrency =
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$'
          .regPattern;

  /// Checks if string is URL.
  static final isURL =
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$"
          .regPattern;

  /// Checks if string is email.
  static final isEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
          .regPattern;

  // /// Checks if string is phone number.
  // static final isPhoneNumber {
  //   if (s.length > 16 || s.length < 9) return false;
  //   return  r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$'.regPattern;
  // }

  /// Checks if string is DateTime (UTC or Iso8601).
  static final isDateTime =
      r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$'.regPattern;

  /// Checks if string is MD5 hash.
  static final isMD5 = r'^[a-f0-9]{32}$'.regPattern;

  /// Checks if string is SHA1 hash.
  static final isSHA1 =
      r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})'.regPattern;

  /// Checks if string is SHA256 hash.
  static final isSHA256 =
      r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}'.regPattern;

  /// Checks if string is SSN (Social Security Number).
  static final isSSN =
      r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$'
          .regPattern;

  /// Checks if string is binary.
  static final isBinary = r'^[0-1]+$'.regPattern;

  /// Checks if string is IPv4.
  static final isIPv4 =
      r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$'.regPattern;

  /// Checks if string is IPv6.
  static final isIPv6 =
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$'
          .regPattern;

  /// Checks if string is hexadecimal.
  /// Example: HexColor = #12F
  static final isHexadecimal =
      r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'.regPattern;
}
