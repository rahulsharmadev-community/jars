// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings

part 'file_format_pattern.dart';
part 'password_pattern.dart';
part 'regpattern.dart';

const regPatterns = _RegPatterns._internal();

/// Enumeration of PAN (Permanent Account Number) types with corresponding code.
enum PanType {
  ASSOCIATION_OF_PERSONS('A'),
  BODY_OF_INDIVIDUALS('B'),
  COMPANY('C'),
  FIRM('F'),
  GOVERNMENT('G'),
  HINDU_UNDIVIDED_FAMILY('H'),
  LOCAL_AUTHORITY('L'),
  ARTIFICIAL_JURIDICAL_PERSON('J'),
  INDIVIDUAL_PERSON('P'),
  TRUST_ASSOCIATION_OF_PERSONS('T');

  final String code;
  const PanType(this.code);
  static const codes = 'ABCFGHLJPT'; // Valid codes for PAN types
}

class _RegPatterns with _PasswordRegPattern {
  const _RegPatterns._internal();

  _FileFormatRegPatterns get fileFormats => _FileFormatRegPatterns();

  /// Returns a regex pattern used for PAN number validation.
  ///
  /// The pattern ensures the PAN number format is:
  ///
  /// - First 3 characters: Any uppercase letters.
  /// - Fourth character: Specific to the `typeRestriction` if provided, otherwise any valid PAN type character.
  /// - Fifth character: Any letter from the first characters of `firstName`, `middle`, and `lastName` if provided, or 'A-Z' if none provided.
  /// - Last 4 characters: Numeric digits.
  /// - Last character: Any uppercase letter.
  ///
  /// Throws an error if the generated regex pattern is invalid.
  RegPattern panNumber({PanType? typeRestriction, String? firstName, String? middle, String? lastName}) {
    var codes = typeRestriction?.code ?? PanType.codes;
    var nfc = (firstName?.trim()[0] ?? '') + (middle?.trim()[0] ?? '') + (lastName?.trim()[0] ?? '');
    if (nfc.isEmpty) nfc = 'A-Z';
    return RegPattern(
      pattern: r'^[A-Z]{3}[' + codes + ']{1}[' + nfc + ']{1}[0-9]{4}[A-Z]{1}',
      message: 'Invalid PAN number.',
    );
  }

  /// Username regex
  RegPattern username({
    bool allowSpace = false,
    int minLength = 2,
    int maxLength = 16,
  }) {
    final min = (minLength < 2 ? 2 : minLength - 2).toString();
    final max = (maxLength - 2).toString();
    return RegPattern(
        pattern: allowSpace
            ? r'^[a-zA-Z0-9][a-zA-Z0-9_\-/. ]{' + min + ',' + max + r'}[a-zA-Z0-9]$'
            : r'^[a-zA-Z0-9][a-zA-Z0-9_\-/.]{' + min + ',' + max + r'}[a-zA-Z0-9]$',
        message: 'Only accepts a-zA-Z - _ • / ${allowSpace ? 'and space.' : ''}');
  }

  /// Name regex
  RegPattern name([bool allowSpace = false]) => RegPattern(
      pattern: allowSpace ? r"^[a-zA-Z.\-' ]*$" : r"^[a-zA-Z.\-']*$",
      message: 'Only accepts a-zA-Z ′ - • ${allowSpace ? 'and space.' : ''}');

  /// Email regex
  RegPattern get email => RegPattern(
      pattern:
          r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$",
      message: 'Invalid email address.');

  /// URL regex
  RegPattern get url => RegPattern(
        pattern:
            r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
        message: 'Invalid url address.',
      );

  /// Phone Number regex
  /// Must started by either, "0", "+", "+XX <X between 2 to 4 digit>", "(+XX <X between 2 to 3 digit>)"
  /// Can add whitespace separating digit with "+" or "(+XX)"
  /// Example: 05555555555, +555 5555555555, (+123) 5555555555, (555) 5555555555, +5555 5555555555
  RegPattern get phone => RegPattern(
        pattern: r'^(|0|\+|(\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)([0-9]*|\d{2,4}-\d{2,4}(-\d{2,4})?)$',
        message: 'Invalid phone number.',
      );

  /// DateTime regex (UTC)
  /// Unformatted date time (UTC and Iso8601)
  /// Example: 2020-04-27 08:14:39.977, 2020-04-27T08:14:39.977, 2020-04-27 01:14:39.977Z
  RegPattern get basicDateTime => RegPattern(
      pattern: r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$',
      message: 'Invalid UTC or Iso8601 format.');

  /// MD5 regex
  RegPattern get md5 => RegPattern(
        pattern: r'^[a-f0-9]{32}$',
        message: 'Invalid md5 format.',
      );

  /// SHA1 regex
  RegPattern get sha1 => RegPattern(
        pattern: r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})',
        message:
            'Either 40 hexadecimal characters or 20 pairs of hexadecimal characters separated by colons.',
      );

  /// SHA256 regex
  RegPattern get sha256 => RegPattern(
        pattern: r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}',
        message:
            'Either be 64 hexadecimal characters or 32 pairs of hexadecimal characters separated by colons.',
      );

  /// SSN (Social Security Number) regex
  RegPattern get ssn => RegPattern(
        pattern: r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$',
        message:
            "ensuring it doesn't start with all zeros in each section and follows the typical format: XXX-XX-XXXX.",
      );

  /// IPv4 regex
  RegPattern get ipv4 => RegPattern(pattern: r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  /// IPv6 regex
  RegPattern get ipv6 => RegPattern(
      pattern:
          r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$');

  /// ISBN 10 & 13 regex
  RegPattern get isbn =>
      RegPattern(pattern: r'(ISBN(\-1[03])?[:]?[ ]?)?(([0-9Xx][- ]?){13}|([0-9Xx][- ]?){10})');

  /// Github repository regex
  RegPattern get github =>
      RegPattern(pattern: r'((git|ssh|http(s)?)|(git@[\w\.]+))(:(\/\/)?)([\w\.@\:/\-~]+)(\.git)(\/)?');

  /// Passport No. regex
  RegPattern get passport => RegPattern(pattern: r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  /// Currency regex
  RegPattern get currency => RegPattern(
      pattern:
          r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]*)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  /// Use this function to create a regular expression pattern that matches
  /// strings consisting only of digits with allow additional characters within a
  /// specified range of lengths.
  ///
  /// - [**type**]: The type of numbers to match (e.g., decimal, binary, octal).
  /// - [**allowEmptyString**]:
  ///
  ///       - If `true`, the pattern allows for an empty string.
  ///       - If `false`, the pattern requires at least one digit.
  ///
  /// - [**allowSpecialChar**]: Additional characters to allow within the number pattern.
  /// - [**minLength**]: The minimum length required for the number (default is 1).
  /// - [**maxLength**]: The maximum length required for the number (default is 16).
  ///
  ///
  /// ### Example...
  ///```dart
  ///      RegPatterns.number(
  ///               type: Number.octal, // only use [0-7]
  ///               allowEmptyString: true,
  ///               allowSpecialChar: ".,", // allow dots and comma
  ///               minLength: 4,
  ///               maxLength: 8 );
  ///```
  ///
  /// Returns a [RegPatterns] instance with the generated regular expression pattern.
  RegPattern number({
    Number type = Number.decimal,
    bool allowEmptyString = false,
    String allowSpecialChar = '',
    int minLength = 2,
    int maxLength = 16,
  }) {
    final min = minLength.toString();
    final max = maxLength.toString();
    final range = RegExp.escape(type.range + allowSpecialChar);
    final value = allowEmptyString ? '^(|[$range]{$min,$max})\$' : '^[$range]{$min,$max}\$';
    return RegPattern(
      pattern: value,
      message: 'Only contain the numbers ${type.range} ${allowSpecialChar.split('').join(' ')} '
          'and the length should be larger than $min but less than $max.',
    );
  }

  /// Alphabet Only regex (No Whitespace & Symbols)
  RegPattern get alphabetOnly => RegPattern(pattern: r'^[a-zA-Z]+$');

  RegPattern get alphabetAndDigits => RegPattern(pattern: r'^[a-zA-Z]+$');

  /// Postal Code
  postalCode({int maxLength = 6, bool allowAlphabets = false}) => RegPattern(
        pattern: allowAlphabets
            ? r'^[a-zA-Z0-9]{5,' + maxLength.toString() + r'}$'
            : r'^\d{5,' + maxLength.toString() + r'}?$',
      );

  /// HTML Tags
  /// multiLine = true
  RegPattern get htmlTags => RegPattern(
      pattern: r"^<(?:([A-Za-z][A-Za-z0-9]*)\b[^>]*>(?:.*?)</\1>|[A-Za-z][A-Za-z0-9]*\b[^/>]*/>)$",
      message: "Ensures the tags have proper names");

  /// Credit/Debit Card
  RegPattern get creditCard => RegPattern(
      pattern: r"^(?:3[47]\d{2}([\- ]?)\d{6}\1\d{5}|(?:4\d{3}|5[1-5]\d{2}|6011)([\- ]?)\d{4}\2\d{4}\2\d{4})$",
      message: "Invalid credit/debit card format");

  RegPattern get base64 => RegPattern(
      pattern: r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');
}

/// An enumeration (enum) representing different number systems.
enum Number {
  /// Represents [0-1] binary numbers.
  binary(range: '0-1'),

  /// Represents [0-7] octal numbers.
  octal(range: '0-8'),

  /// Represents [0-9] decimal numbers.
  decimal(range: '0-9'),

  /// Represents [0-9, A-F] hexadecimal numbers.
  hexDecimal(range: '0-9A-Fa-f');

  final String range;
  const Number({required this.range});
}
