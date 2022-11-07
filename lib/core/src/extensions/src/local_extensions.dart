class LocalExtensions {
  LocalExtensions._();

  /// Checks if data is null.
  static bool isNull(dynamic value) => value == null;

  /// In dart2js (in flutter v1.17) a var by default is undefined.
  /// *Use this only if you are in version <- 1.17*.
  /// So we assure the null type in json convertions to avoid the
  /// "value":value==null?null:value; someVar.nil will force the null type
  /// if the var is null or undefined.
  /// `nil` taken from ObjC just to have a shorter sintax.

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }

    // Pretty sure that isNullOrBlank should't be validating
    // iterables... but I'm going to keep this for compatibility.
    return value.isEmpty;
  }

  /// Checks if string is int or double.
  static bool isNum(String value) {
    if (isNull(value)) {
      return false;
    }

    return num.tryParse(value) is num;
  }

  /// Checks if all data have same value.
  /// Example: 111111 -> true, wwwww -> true, 1,1,1,1 -> true
  static bool isHomogenous(dynamic value) {
    final temp = value is int ? value = value.toString() : value;
    if ((temp is String || temp is List) && !isNullOrBlank(temp)) {
      for (var i = 0; i < (temp.length as num); i++) {
        if (temp[i] != temp[0]) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  /// Checks if length of data is GREATER than maxLength.
  static bool isLengthGreaterThan(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length > maxLength;
  }

  /// Checks if length of data is GREATER OR EQUAL to maxLength.
  static bool isLengthGreaterOrEqual(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length >= maxLength;
  }

  /// Checks if length of data is LOWER than maxLength.
  ///
  /// This method is deprecated, use [isLengthLessThan] instead
  @deprecated
  static bool isLengthLowerThan(dynamic value, int maxLength) =>
      isLengthLessThan(value, maxLength);

  /// Checks if length of data is LESS than maxLength.
  static bool isLengthLessThan(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);
    if (length == null) {
      return false;
    }

    return length < maxLength;
  }

  /// Checks if length of data is LOWER OR EQUAL to maxLength.
  ///
  /// This method is deprecated, use [isLengthLessOrEqual] instead
  @deprecated
  static bool isLengthLowerOrEqual(dynamic value, int maxLength) =>
      isLengthLessOrEqual(value, maxLength);

  /// Checks if length of data is LESS OR EQUAL to maxLength.
  static bool isLengthLessOrEqual(dynamic value, int maxLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length <= maxLength;
  }

  /// Checks if length of data is EQUAL to maxLength.
  static bool isLengthEqualTo(dynamic value, int otherLength) {
    final length = _obtainDynamicLength(value);

    if (length == null) {
      return false;
    }

    return length == otherLength;
  }

  /// Checks if length of data is BETWEEN minLength to maxLength.
  static bool isLengthBetween(dynamic value, int minLength, int maxLength) {
    if (isNull(value)) {
      return false;
    }

    return isLengthGreaterOrEqual(value, minLength) &&
        isLengthLessOrEqual(value, maxLength);
  }

  /// Checks if num a LOWER than num b.
  static bool isLowerThan(num a, num b) => a < b;

  /// Checks if num a GREATER than num b.
  static bool isGreaterThan(num a, num b) => a > b;

  /// Checks if num a EQUAL than num b.
  static bool isEqual(num a, num b) => a == b;

  //Check if num is a cnpj
  static bool isCnpj(String cnpj) {
    // Obter somente os números do CNPJ
    final numbers = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    // Testar se o CNPJ possui 14 dígitos
    if (numbers.length != 14) {
      return false;
    }

    // Testar se todos os dígitos do CNPJ são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) {
      return false;
    }

    // Dividir dígitos
    final digits = numbers.split('').map(int.parse).toList();

    // Calcular o primeiro dígito verificador
    var calcDv1 = 0;
    var j = 0;
    for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
      calcDv1 += digits[j++] * i;
    }
    calcDv1 %= 11;
    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Testar o primeiro dígito verificado
    if (digits[12] != dv1) {
      return false;
    }

    // Calcular o segundo dígito verificador
    var calcDv2 = 0;
    j = 0;
    for (var i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
      calcDv2 += digits[j++] * i;
    }
    calcDv2 %= 11;
    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Testar o segundo dígito verificador
    if (digits[13] != dv2) {
      return false;
    }

    return true;
  }

  /// Checks if the cpf is valid.
  static bool isCpf(String cpf) {
    // if (cpf == null) {
    //   return false;
    // }

    // get only the numbers
    final numbers = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    // Test if the CPF has 11 digits
    if (numbers.length != 11) {
      return false;
    }
    // Test if all CPF digits are the same
    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) {
      return false;
    }

    // split the digits
    final digits = numbers.split('').map(int.parse).toList();

    // Calculate the first verifier digit
    var calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digits[10 - i] * i;
    }
    calcDv1 %= 11;

    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    // Tests the first verifier digit
    if (digits[9] != dv1) {
      return false;
    }

    // Calculate the second verifier digit
    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digits[11 - i] * i;
    }
    calcDv2 %= 11;

    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    // Test the second verifier digit
    if (digits[10] != dv2) {
      return false;
    }

    return true;
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static String createPath(String path, [Iterable? segments]) {
    if (segments == null || segments.isEmpty) {
      return path;
    }
    final list = segments.map((e) => '/$e');
    return path + list.join();
  }
}

// ___________________________________________________________GLOBLE_FUNCTION_________________________
/// Returns whether a dynamic value PROBABLY
/// has the isEmpty getter/method by checking
/// standard dart types that contains it.
///
/// This is here to for the 'DRY'

/// Returns whether a dynamic value PROBABLY
/// has the length getter/method by checking
/// standard dart types that contains it.
///
/// This is here to for the 'DRY'
bool _hasLength(dynamic value) {
  return value is Iterable || value is String || value is Map;
}

/// Obtains a length of a dynamic value
/// by previously validating it's type
///
/// Note: if [value] is double/int
/// it will be taking the .toString
/// length of the given value.
///
/// Note 2: **this may return null!**
///
/// Note 3: null [value] returns null.
int? _obtainDynamicLength(dynamic value) {
  if (value == null) {
    // ignore: avoid_returning_null
    return null;
  }

  if (_hasLength(value)) {
    return value.length as int?;
  }

  if (value is int) {
    return value.toString().length;
  }

  if (value is double) {
    return value.toString().replaceAll('.', '').length;
  }

  // ignore: avoid_returning_null
  return null;
}
