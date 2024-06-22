// ignore_for_file: constant_identifier_names

import 'package:regpatterns/regpatterns.dart';
import 'package:test/test.dart';

void main() {
  group('PanGstPatterns Tests', () {
    test('Valid GST Number', () {
      final validGstNumbers = [
        '07AABCR1718E1ZR',
        '37AABCR1718E1CZ',
        '27AABCR1718E1ZP',
        '09AAACR5055K1Z5',
        '27AAACR5055K3Z5',
        '27AAACR5055K1Z7'
      ];

      for (var gstNumber in validGstNumbers) {
        final pattern = regPatterns.gstNumber();
        expect(pattern.hasMatch(gstNumber), isTrue, reason: 'Should match valid GST number: $gstNumber');
      }
    });

    test('Invalid GST Number', () {
      final invalidGstNumbers = [
        '00ABCDE1234FZ1A',
        '01ABCDE1234FZ1', // Missing last character
        '33ABCDE1234FZ1C1', // Extra character
        '27ABCDE1234FX1B', // Invalid character in the middle
      ];

      for (var gstNumber in invalidGstNumbers) {
        final pattern = regPatterns.gstNumber();
        expect(pattern.hasMatch(gstNumber), isFalse,
            reason: 'Should not match invalid GST number: $gstNumber');
      }
    });

    test('Valid PAN Number', () {
      final validPanNumbers = [
        'AABCR1718E',
        'AABCR1718E',
        'AABCR1718E',
        'AAACR5055K',
        'AAACR5055K',
        'AAACR5055K'
      ];

      for (var panNumber in validPanNumbers) {
        final pattern = regPatterns.panNumber();
        expect(pattern.hasMatch(panNumber), isTrue, reason: 'Should match valid PAN number: $panNumber');
      }
    });

    test('Invalid PAN Number', () {
      final invalidPanNumbers = [
        'ABC1234F', // Missing letters
        'ABCDE123F', // Missing digit
        'ABCDE12345', // Missing last character
        '1BCDE1234F', // Invalid starting character
      ];

      for (var panNumber in invalidPanNumbers) {
        final pattern = regPatterns.panNumber();
        expect(pattern.hasMatch(panNumber), isFalse,
            reason: 'Should not match invalid PAN number: $panNumber');
      }
    });
  });

  group('Testing on real data', () {
    final invalidData = [
      (
        gst: '09AAACR5055K1Z5',
        pan: 'AAACR5055K',
        f: 'RELIANCE',
        m: 'INDUSTRIES',
        l: 'LIMITED',
        type: PanType.COMPANY
      ),
      (
        gst: '01AABCR1718E1Z3',
        pan: 'AABCR1718E',
        f: 'RELIANCE',
        m: 'RETAIL',
        l: 'LIMITED',
        type: PanType.COMPANY
      ),
      (
        gst: '37AAACK8657J1Z1',
        pan: 'AAACK8657J',
        f: 'ADANI',
        m: 'KRISHNAPATNAM',
        l: 'PORT',
        type: PanType.COMPANY
      ),
      (gst: '21AAACT2803M1ZN', pan: 'AAACT2803M', f: 'TATA', m: 'STEEL', l: 'LIMITED', type: PanType.COMPANY)
    ];
    test('Invalid PAN Number', () {
      for (var data in invalidData) {
        final pan = regPatterns.panNumber(
          firstName: data.f,
          middle: data.m,
          lastName: data.l,
          typeRestriction: PanType.COMPANY,
        );

        expect(pan.hasMatch(data.pan), isTrue, reason: 'Should not match invalid PAN number: $data');
      }
    });
    test('Invalid GST Number', () {
      for (var data in invalidData) {
        final gst = regPatterns.gstNumber(
          firstName: data.f,
          middle: data.m,
          lastName: data.l,
          typeRestriction: PanType.COMPANY,
        );
        expect(gst.hasMatch(data.gst), isTrue, reason: 'Should not match invalid GST number: $data');
      }
    });
  });
}
