// ignore_for_file: constant_identifier_names

extension RegPatternsExt on RegPatterns {
  bool hasMatch(String value, {multiLine = false}) =>
      RegExp(pattern, multiLine: multiLine).hasMatch(value);
}

class RegPatterns {
  final String pattern, message;
  const RegPatterns._({
    required this.pattern,
    String? message,
  }) : message = message ?? 'Invalid format';

  /// Username regex
  static username([bool allowWhitespace = false]) => RegPatterns._(
      pattern: allowWhitespace
          ? r'^[a-zA-Z0-9 ][a-zA-Z0-9_. ]+[a-zA-Z0-9 ]$'
          : r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$',
      message:
          'Username only contain number, alphabet, dot and underscore only.');

  /// Name regex
  static name([bool allowWhitespace = false]) => RegPatterns._(
      pattern: allowWhitespace ? r"^[a-zA-Z.\-' ]*$" : r"^[a-zA-Z.\-']*$",
      message:
          'Only accepts a-zA-Z ′ - • ${allowWhitespace ? 'and whitespace.' : ''}');

  /// Email regex
  static const email = RegPatterns._(
      pattern:
          r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$",
      message: 'Invalid email address.');

  /// URL regex
  static const url = RegPatterns._(
    pattern:
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
    message: 'Invalid url address.',
  );

  /// Phone Number regex
  /// Must started by either, "0", "+", "+XX <X between 2 to 4 digit>", "(+XX <X between 2 to 3 digit>)"
  /// Can add whitespace separating digit with "+" or "(+XX)"
  /// Example: 05555555555, +555 5555555555, (+123) 5555555555, (555) 5555555555, +5555 5555555555
  static const phone = RegPatterns._(
    pattern:
        r'^(0|\+|(\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)([0-9]*|\d{2,4}-\d{2,4}(-\d{2,4})?)$',
    message: 'Invalid phone number.',
  );

  /// Hexadecimal regex
  static const hexadecimal = RegPatterns._(
    pattern: r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$',
    message:
        "Can start with an '#' and are followed by either 3 or 6 hexadecimal characters (0-9, a-f, A-F)",
  );

  static const svg = RegPatterns._(
    pattern: r'.(svg)$',
    message: 'Invalid vector format.',
  );

  /// Checks if the provided string represents a valid image file supported by Flutter.
  /// Supports file extensions: .jpeg, .jpg, .gif, .png, .bmp, .webp, .svg
  ///
  /// If the input string matches one of these image file extensions,
  /// it is considered a valid Flutter supported image file.
  static const image = RegPatterns._(
    pattern: r'.(jpeg|jpg|gif|png|bmp|webp|svg)$',
    message: 'Invalid flutter supported image file.',
  );

  /// Audio regex
  static const audio = RegPatterns._(
    pattern: r'.(mp3|wav|wma|amr|ogg)$',
    message: 'Invalid audio supported image file.',
  );

  /// Video regex
  static const video = RegPatterns._(
    pattern: r'.(mp4|avi|wmv|rmvb|mpg|mpeg|3gp)$',
    message: 'Invalid video format.',
  );

  /// Txt regex
  static const txt = RegPatterns._(
    pattern: r'.txt$',
    message: 'Invalid txt format.',
  );

  static const word = RegPatterns._(
    pattern: r'.(doc|docx)$',
    message: 'Invalid format only accepts doc and docx format.',
  );

  /// Excel regex
  static const excel = RegPatterns._(
    pattern: r'.(xls|xlsx)$',
    message: 'Invalid format only accepts xls and xlsx format.',
  );

  /// PPT regex
  static const ppt = RegPatterns._(
    pattern: r'.(ppt|pptx)$',
    message: 'Invalid format only accepts ppt and pptx format.',
  );

  /// APK regex
  static const apk = RegPatterns._(
    pattern: r'.apk$',
    message: 'Invalid apk format ',
  );

  /// PDF regex
  static const pdf = RegPatterns._(
    pattern: r'.pdf$',
    message: 'Invalid pdf format',
  );

  /// HTML regex
  static const html = RegPatterns._(
    pattern: r'.html$',
    message: 'Invalid html format.',
  );

  /// DateTime regex (UTC)
  /// Unformatted date time (UTC and Iso8601)
  /// Example: 2020-04-27 08:14:39.977, 2020-04-27T08:14:39.977, 2020-04-27 01:14:39.977Z
  static const basicDateTime = RegPatterns._(
      pattern: r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$',
      message: 'Invalid UTC or Iso8601 format.');

  /// MD5 regex
  static const md5 = RegPatterns._(
    pattern: r'^[a-f0-9]{32}$',
    message: 'Invalid md5 format.',
  );

  /// SHA1 regex
  static const sha1 = RegPatterns._(
    pattern: r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})',
    message:
        'Either 40 hexadecimal characters or 20 pairs of hexadecimal characters separated by colons.',
  );

  /// SHA256 regex
  static const sha256 = RegPatterns._(
    pattern: r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}',
    message:
        'Either be 64 hexadecimal characters or 32 pairs of hexadecimal characters separated by colons.',
  );

  /// SSN (Social Security Number) regex
  static const ssn = RegPatterns._(
    pattern:
        r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$',
    message:
        "ensuring it doesn't start with all zeros in each section and follows the typical format: XXX-XX-XXXX.",
  );

  /// IPv4 regex
  static const ipv4 = RegPatterns._(
      pattern: r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  /// IPv6 regex
  static const ipv6 = RegPatterns._(
      pattern:
          r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$');

  /// ISBN 10 & 13 regex
  static const isbn = RegPatterns._(
      pattern:
          r'(ISBN(\-1[03])?[:]?[ ]?)?(([0-9Xx][- ]?){13}|([0-9Xx][- ]?){10})');

  /// Github repository regex
  static const github = RegPatterns._(
      pattern:
          r'((git|ssh|http(s)?)|(git@[\w\.]+))(:(\/\/)?)([\w\.@\:/\-~]+)(\.git)(\/)?');

  /// Passport No. regex
  static const passport = RegPatterns._(pattern: r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  /// Currency regex
  static const currency = RegPatterns._(
      pattern:
          r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  /// Consist only 0 & 1
  /// - **allowEmpty**: If `true`, the pattern allows for an empty string.
  ///                 If `false`, the pattern requires at least one binary digit.
  static RegPatterns binaryDigits([allowEmpty = false]) {
    var value = !allowEmpty ? r'^[0-1]+$' : r'^[0-1]*$';
    return RegPatterns._(pattern: value);
  }

  /// Consist only 0 to 7
  /// - **allowEmpty**: If `true`, the pattern allows for an empty string.
  ///                 If `false`, the pattern requires at least one octal digit .
  static RegPatterns octalDigits([allowEmpty = false]) {
    var value = !allowEmpty ? r'^[0-7]+$' : r'^[0-7]*$';
    return RegPatterns._(pattern: value);
  }

  /// Consist only 0 to 9
  /// - **allowEmpty**: If `true`, the pattern allows for an empty string.
  ///                 If `false`, the pattern requires at least one decimal digit .
  static RegPatterns decimalDigits([allowEmpty = false]) {
    var value = !allowEmpty ? r'^[0-9]+$' : r'^[0-9]*$';
    return RegPatterns._(pattern: value);
  }

  /// Consist only 0 to F
  ///   - [allowEmpty]: If `true`, the pattern allows for an empty string.
  ///                   If `false`, the pattern requires at least one digit.
  static RegPatterns hexDecimalDigits([allowEmpty = false]) {
    var value = !allowEmpty ? r'^[0-9A-Fa-f]+$' : r'^[0-9A-Fa-f]*$';
    return RegPatterns._(pattern: value);
  }

  /// Alphabet Only regex (No Whitespace & Symbols)
  static const alphabetOnly = RegPatterns._(pattern: r'^[a-zA-Z]+$');

  static const alphabetAndDigits = RegPatterns._(pattern: r'^[a-zA-Z]+$');

  /// Postal Code
  static postalCode({int maxLength = 6, bool allowAlphabets = false}) =>
      RegPatterns._(
        pattern: allowAlphabets
            ? r'^[a-zA-Z0-9]{5,' + maxLength.toString() + r'}$'
            : r'^\d{5,' + maxLength.toString() + r'}?$',
      );

  /// HTML Tags
  /// multiLine = true
  static const htmlTags = RegPatterns._(
      pattern:
          r"^<(?:([A-Za-z][A-Za-z0-9]*)\b[^>]*>(?:.*?)</\1>|[A-Za-z][A-Za-z0-9]*\b[^/>]*/>)$",
      message: "Ensures the tags have proper names");

  /// Credit/Debit Card
  static const creditCard = RegPatterns._(
      pattern:
          r"^(?:3[47]\d{2}([\- ]?)\d{6}\1\d{5}|(?:4\d{3}|5[1-5]\d{2}|6011)([\- ]?)\d{4}\2\d{4}\2\d{4})$",
      message: "Invalid credit/debit card format");

  static const base64 = RegPatterns._(
      pattern:
          r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

  /// ### Password validation based on the specified `PasswordType`.
  ///
  /// The function supports various password types, including requirements for minimum and maximum length,
  /// whether whitespace is allowed, and custom failure messages.
  ///
  /// - [type]: The desired [PasswordType] for the password pattern.
  /// - [minLength]: The minimum length required for the password (default is 8).
  /// - [maxLength]: The maximum length required for the password (default is 24).
  /// - [allowWhitespace]: Determines if whitespace characters are allowed in the password (default is false).
  /// - [failedMessage]: An optional custom message to display when password validation fails.
  ///
  static RegPatterns password(
    PasswordType type, {
    int minLength = 8,
    int maxLength = 24,
    allowWhitespace = false,
    String? failedMessage,
  }) {
    late final String value;
    var min = minLength.toString();
    var max = maxLength.toString();
    switch (type) {
      case PasswordType.ANY_CHAR:
        value = !allowWhitespace
            ? r'^\S{' + min + r',' + max + r'}$'
            : r'^[\S ]{' + min + r',' + max + r'}$';

      case PasswordType.ALL_CHAR_LETTER_NUM:
        value = !allowWhitespace
            ? r'^(?=.*[A-Za-z])(?=.*\d)\S{' + min + r',' + max + r'}$'
            : r'^(?=.*[A-Za-z])(?=.*\d)[\S ]{' + min + r',' + max + r'}$';

      case PasswordType.ONLY_LETTER_NUM:
        value = !allowWhitespace
            ? r'^(?=.*[A-Za-z])(?=.*\d)[a-zA-Z0-9]{' + min + r',' + max + r'}$'
            : r'^(?=.*[A-Za-z])(?=.*\d)[a-zA-Z0-9 ]{' +
                min +
                r',' +
                max +
                r'}$';

      case PasswordType.ALL_CHARS_UPPER_LOWER_NUM:
        value = !allowWhitespace
            ? r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S{' + min + r',' + max + r'}$'
            : r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\S ]{' +
                min +
                r',' +
                max +
                r'}$';

      default:
        value = !allowWhitespace
            ? r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{' +
                min +
                r',' +
                max +
                r'}$'
            : r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[\S ]{' +
                min +
                r',' +
                max +
                r'}$';
    }
    return RegPatterns._(
      pattern: value,
      message: failedMessage ?? type.message,
    );
  }
}

enum PasswordType {
  /// Allowing all character with
  /// Requires at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
  ALL_CHARS_UPPER_LOWER_NUM_SPECIAL(
      message:
          'Allowing all character with Requires at least: 1 uppercase & 1 lowecase letter, 1 number, & 1 special character'),

  /// Allowing all character with
  /// Requires at least: 1 uppercase letter, 1 lowecase letter & 1 number
  ALL_CHARS_UPPER_LOWER_NUM(
      message:
          'Allowing all character with Requires at least: 1 uppercase & 1 lowecase letter, 1 number'),

  /// Allowing all character with
  /// Requires at least: 1 letter & 1 number
  ALL_CHAR_LETTER_NUM(
      message:
          'Allowing all character with Requires at least: 1 letter & 1 number'),

  /// Allowing only letter &  number
  ONLY_LETTER_NUM(message: 'Allowing only letter &  number'),

  /// Allows all characters without specific character requirements
  ANY_CHAR(
      message: 'Allows all characters without specific character requirements');

  final String message;
  const PasswordType({required this.message});
}
