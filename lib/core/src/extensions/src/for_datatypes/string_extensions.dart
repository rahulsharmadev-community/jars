import 'package:jars/jars.dart';

extension StringExtensions on String {
  RegPattern get regPattern => RegPattern(this);

  ReCase get reCase => ReCase(this);

  bool get isBlank => trim().isEmpty;

  /// Sample
  /// ```
  /// void main(){
  ///   var path = 'roo/folder/sample.pdf';
  ///   print(path.format.isPDF)
  /// }
  /// ```
  FilesFormat get format => FilesFormat(this);

  /// Checks if string is boolean.
  bool get isBool => (this == 'true' || this == 'false');

  /// Sample
  /// ```dart
  /// void main(){
  ///   bool isValidEmail = 'sample@gmail.com'.regMatch(RegPatterns.isEmail);
  ///   print(isValidEmail)
  /// }
  /// ```
  /// ### Use RegPatterns library for RegPattern
  bool regMatch(RegPattern regPattern) => RegPattern.regMatch(this, regPattern);

  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  String get onlyfirstUppercase {
    if (isBlank) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Remove all whitespace inside string
  /// Example: your name => yourname
  String get removeAllSpace => replaceAll(' ', '');

  ///
  /// ```dart
  ///   String sample ='what is \n your name';
  ///   print(sample); \\ whatisyourname
  /// ```
  /// Remove all whitespace & newline inside string
  String get trimAll => replaceAll(RegExp(r'[ |\\n]+'), '');

  /// Extract numeric value of string
  /// Example: OTP 12312 27/04/2020 => 1231227042020ß
  /// If firstword only is true, then the example return is "12312"
  /// (first found numeric word)
  String numericOnly({bool firstWordOnly = false}) {
    var numericOnlyStr = '';
    for (var i = 0; i < length; i++) {
      if (regMatch(RegPatterns.isNumericOnly)) {
        numericOnlyStr += this[i];
      }
      if (firstWordOnly && numericOnlyStr.isNotEmpty && this[i] == " ") {
        break;
      }
    }
    return numericOnlyStr;
  }

  String createPath([Iterable? segments]) {
    final path = startsWith('/') ? this : '/$this';

    if (segments == null || segments.isEmpty) {
      return path;
    }
    final list = segments.map((e) => '/$e');
    return path + list.join();
  }

  /// Checks if string is Palindrom.
  bool get isPalindrom {
    final cleanString = toLowerCase()
        .replaceAll(RegExp(r"\s+"), '')
        .replaceAll(RegExp(r"[^0-9a-zA-Z]+"), "");

    for (var i = 0; i < cleanString.length; i++) {
      if (cleanString[i] != cleanString[cleanString.length - i - 1]) {
        return false;
      }
    }
    return true;
  }
}
