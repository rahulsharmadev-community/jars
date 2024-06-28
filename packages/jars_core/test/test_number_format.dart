import 'package:jars_core/jars_core.dart';
import 'package:test/test.dart';
import 'package:jars_core/src/utility/src/number_format/number_format.dart';

void main() {
  test('Rounding/truncating fractions/Currency Symbol', () {
    var expected = [
      '9',
      '\$9.1',
      '9.12',
      '\$9.123',
      '9.1235',
      '\$9.12346',
      '9.123457',
      '\$9.1234568',
      '9.12345679',
      '\$9.123456789',
      '9.123456789',
      '\$9.123456789',
    ];
    var f = NumberFormat.en();
    for (var i = 0; i < expected.length; i++) {
      expect(
          f.simple(9.123456789, fractionDigits: i, currencySymbol: i % 2 != 0, trimZero: true), expected[i],
          reason: 'maximumFractionDigits: $i');
    }
  });

  test('Padding right', () {
    var expected = ['1', '1.0', '1.00', '1.000', '1.0000', '1.00000', '1.000000'];
    for (var i = 0; i < 6; i++) {
      var f = NumberFormat.en();
      expect(f.simple(1, fractionDigits: i), expected[i], reason: 'Padding right: $i');
    }
  });

  test('maximumIntegerDigits does not do much', () {
    var expected = [
      '9,876,543,210',
      '9,876,543,210',
      '9,876,543,210',
      '9,876,543,210',
      '9,876,543,210',
      '9,876,543,210',
    ];
    for (var i = 0; i < expected.length; i++) {
      var f = NumberFormat.en();
      expect(f.simple(9876543210, fractionDigits: i, trimZero: true), expected[i],
          reason: 'maximumIntegerDigits: $i');
    }
  });
  test('Compact/TrimZero/Currency Symbol', () {
    var expected = {
      90: '90',
      900: '900',
      9000: '9K',
      90000: '90K',
      900000: '900K',
      9000000: '9M',
      90000000: '90M',
      900000000: '900M',
      9000000000: '9B',
      9000000000000: '9T',
      9000000000000000: '9Q',
      9000000000000000000: '9,000Q',
    }.entries.toList();
    var f = NumberFormat.en();
    for (var i = 0; i < expected.length; i++) {
      expect(f.compact(expected[i].key, trimZero: true), expected[i].value,
          reason: 'maximumFractionDigits: $i');
    }
  });
}
