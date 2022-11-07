import '/resources/library_resourses.dart';
import '/models/reg_pattern.dart';
import 'package:flutter/material.dart';
import '../local_extensions.dart';

extension StringExtensions on String {
  bool get isNum => LocalExtensions.isNum(this);

  RegPattern get regPattern => RegPattern(this);

  bool get isBlank => trim().isEmpty;

  /// Checks if string is boolean.
  bool get isBool {
    if (isNum) {
      return false;
    }
    return (this == 'true' || this == 'false');
  }

  /// Sample
  /// ```dart
  /// void main(){
  ///   var file = 'roo/folder/sample.pdf';
  ///   print(file.isPDF)
  /// }
  /// ```
  FilesFormat get isff => FilesFormat(this);

  /// Sample
  /// ```dart
  /// void main(){
  ///   bool isValidEmail = 'sample@gmail.com'.regMatch(RegPatterns.isEmail);
  ///   print(isValidEmail)
  /// }
  /// ```
  /// ### Use RegPatterns library for RegPattern
  bool regMatch(RegPattern regPattern) => RegPattern.regMatch(this, regPattern);

  bool get isCpf => LocalExtensions.isCpf(this);

  bool get isCnpj => LocalExtensions.isCnpj(this);

  /// Checks if a contains b (Treating or interpreting upper- and lowercase
  /// letters as being the same).
  bool isSame(String b) => toLowerCase().contains(b.toLowerCase());

  bool hasMatch(String pattern) => LocalExtensions.hasMatch(this, pattern);

  /// Capitalize each word inside string
  /// Example: your name => Your Name, your name => Your name
  String get capitalize => split(' ').map((e) {
        if (e.isBlank) return e;
        return e[0].toUpperCase() + substring(1).toLowerCase();
      }).join(' ');

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

  /// Camelcase string
  /// Example: your name => yourName
  String get camelCase {
    final separatedWords = split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));

    var newString = '';

    for (final word in separatedWords) {
      newString += word[0].toUpperCase() + word.substring(1).toLowerCase();
    }

    return newString[0].toLowerCase() + newString.substring(1);
  }

  /// snake_case
  String? snakeCase([String separator = '_']) {
    if (LocalExtensions.isNullOrBlank(this)) {
      return null;
    }
    return groupIntoWords.map((word) => word.toLowerCase()).join(separator);
  }

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

  /// credits to "ReCase" package.
  static final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
  static final _symbolSet = {' ', '.', '/', '_', '\\', '-'};
  List<String> get groupIntoWords {
    var sb = StringBuffer();
    var words = <String>[];
    var isAllCaps = toUpperCase() == this;

    for (var i = 0; i < length; i++) {
      var char = this[i];
      var nextChar = i + 1 == length ? null : this[i + 1];
      if (_symbolSet.contains(char)) {
        continue;
      }
      sb.write(char);
      var isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          _symbolSet.contains(nextChar);
      if (isEndOfWord) {
        words.add('$sb');
        sb.clear();
      }
    }
    return words;
  }

  // ___________________________________________WIDGET________________

  Text wText(String data, {Key? key, TextStyle? style}) =>
      Text(this, key: key, style: style);
}
