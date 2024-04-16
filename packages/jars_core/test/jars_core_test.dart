import 'dart:math';

import 'package:jars_core/src/utility/number_format/number_format.dart';

void main(List<String> args) {
  double n = 0;
  while (n < pow(10, 20)) {
    print(NumberFormat.en_in().simple(n, currencySymbol: true, separator: '-', prefix: '=>', trimZero: true));
    n = n * 9.4 + 1;
  }
}
