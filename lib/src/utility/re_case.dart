class ReCase {
  final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');

  final symbolSet = {' ', '.', '/', '_', '\\', '-'};

  late String originalText;
  late List<String> _words;

  ReCase(String text) {
    originalText = text;
    _words = getWords(text);
  }

  List<String> getWords(String text) {
    StringBuffer sb = StringBuffer();
    List<String> words = [];
    bool isAllCaps = text.toUpperCase() == text;

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      String? nextChar = i + 1 == text.length ? null : text[i + 1];

      if (symbolSet.contains(char)) continue;

      sb.write(char);

      bool isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          symbolSet.contains(nextChar);

      if (isEndOfWord) {
        words.add(sb.toString());
        sb.clear();
      }
    }

    return words;
  }

  /// camelCase
  String get camelCase => getCamelCase();

  /// CONSTANT_CASE
  String get constantCase => getConstantCase();

  /// Sentence case
  String get sentenceCase => getSentenceCase();

  /// snake_case
  String get snakeCase => getSnakeCase();

  /// dot.case
  String get dotCase => getSnakeCase(separator: '.');

  /// param-case
  String get paramCase => getSnakeCase(separator: '-');

  /// path/case
  String get pathCase => getSnakeCase(separator: '/');

  /// PascalCase
  String get pascalCase => getPascalCase();

  /// Header-Case
  String get headerCase => getPascalCase(separator: '-');

  /// Title Case
  String get titleCase => getPascalCase(separator: ' ');

  String getCamelCase({String separator = ''}) {
    List<String> words = _words.map(upperCaseFirstLetter).toList();
    if (_words.isNotEmpty) {
      words[0] = words[0].toLowerCase();
    }

    return words.join(separator);
  }

  String getConstantCase({String separator = '_'}) {
    List<String> words = _words.map((word) => word.toUpperCase()).toList();

    return words.join(separator);
  }

  String getPascalCase({String separator = ''}) {
    List<String> words = _words.map(upperCaseFirstLetter).toList();

    return words.join(separator);
  }

  String getSentenceCase({String separator = ' '}) {
    List<String> words = _words.map((word) => word.toLowerCase()).toList();
    if (_words.isNotEmpty) {
      words[0] = upperCaseFirstLetter(words[0]);
    }

    return words.join(separator);
  }

  String getSnakeCase({String separator = '_'}) {
    List<String> words = _words.map((word) => word.toLowerCase()).toList();

    return words.join(separator);
  }

  String upperCaseFirstLetter(String word) {
    return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
  }
}
