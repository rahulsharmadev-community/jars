import 'dart:convert';
import 'package:jars_core/jars_core.dart';

extension StringExtensions on String {
  ReCase get reCase => ReCase(this);

  bool get isBlank => trim().isEmpty;

  Uri uri([int start = 0, int? end]) => Uri.parse(this, start, end);

  /// Sample:
  /// ```
  /// void main(){
  ///   print('451251365'.numberReadableFormat);
  /// }
  /// ```
  /// ----------
  /// 451,251,365
  /// ----------
  String numberReadableFormat([String separator = ',']) {
    RegExp readable = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc(Match match) => '${match[1]}$separator';
    return split('.').map((e) => e.replaceAllMapped(readable, mathFunc)).join('.');
  }

  /// Sample
  /// ```
  /// void main(){
  ///   var path = 'roo/folder/sample.pdf';
  ///   print(path.format.isPDF)
  /// }
  /// ```
  String? get fileFormat {
    var startFrom = lastIndexOf('.');
    if (startFrom == -1) return null;
    var last = lastIndexOf('?');
    return substring(startFrom + 1, last == -1 ? null : last);
  }

  /// Checks if string is boolean.
  bool get isBool => (this == 'true' || this == 'false');

  /// Sample
  /// ```dart
  /// void main(){
  ///   bool isValidEmail = 'sample@gmail.com'.regMatch(RegPatterns.email);
  ///   print(isValidEmail)
  /// }
  /// ```
  /// ### Use RegPatterns library for RegPattern
  bool regMatch(RegPatterns regPattern) => regPattern.hasMatch(this);

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
  /// Example: OTP 12312 27/04/2020 => 1231227042020
  /// If firstword only is true, then the example return is "12312"
  /// (first found numeric word)
  String numericOnly({bool firstWordOnly = false}) {
    var numericOnlyStr = '';
    for (var i = 0; i < length; i++) {
      if (regMatch(RegPatterns.number())) {
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

  List<String> get toList => split('');

  List<String> get toReversedList => split('').reversed.toList();

  String get reversed => split('').reversed.join('');

  /// A palindrome is a sequence of characters that reads the same forwards and backwards
  /// when ignoring spaces, non-alphanumeric characters, and considering letter casing.
  ///
  /// Returns `true` if the string is a palindrome(normal and reversed are same), and ` false` otherwise.
  /// ```
  bool isPalindrom([removeAllSpace = false]) {
    final cleanString = removeAllSpace ? this.removeAllSpace : this;
    return cleanString == cleanString.reversed;
  }

  /// Base64 encryption
  String get toEncodedBase64 => base64.encode(utf8.encode(this));

  /// Base64 decryption
  String get toDecodedBase64 => String.fromCharCodes(base64.decode(this));

  /// Perform utf8 encoding
  List<int> get utf8Encode => utf8.encode(this);
}
