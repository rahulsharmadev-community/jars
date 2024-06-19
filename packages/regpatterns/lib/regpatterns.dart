/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings

part 'src/patterns/file_format_patterns.dart';
part 'src/patterns/password_patterns.dart';
part 'src/patterns/numeric_patterns.dart';
part 'src/patterns/other_patterns.dart';
part 'src/regpattern.dart';

const regPatterns = _RegPatterns._internal();

class _RegPatterns with _PasswordRegPatterns, _NumericRegPatterns, _OtherRegPatterns {
  const _RegPatterns._internal();

  _FileFormatRegPatterns get fileFormats => _FileFormatRegPatterns();

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

  /// Postal Code
  RegPattern postalCode({int maxLength = 6, bool allowAlphabets = false}) => RegPattern(
        pattern: allowAlphabets
            ? r'^[a-zA-Z0-9]{5,' + maxLength.toString() + r'}$'
            : r'^\d{5,' + maxLength.toString() + r'}?$',
      );

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
}

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
