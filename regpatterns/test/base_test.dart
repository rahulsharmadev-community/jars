import 'package:test/test.dart';

import 'package:regpatterns/regpatterns.dart';

void main() {
  group('Username Testing', () {
    test('Username with allowSpace = false, minLength = 3, ', () {
      final mixInputs = {
        // input | result
        'JohnDoe': true,
        'user_name': true,
        'user-nam': true,
        'user.nam': true,
        'user/nam': true,
        'user.name12': true,
        'u': false,
        'Jo': false,
        'user@nam': false,
        'username!': false,
        ' usernam': false,
        'username ': false,
        'user nam': false,
        'John': true,
        'Jane Doe': false,
        'Alice Smith Johnson': false, //out of length
        'J': false,
        'John123': true,
        'John Doe Smith Johnson': false,
        'John Doe!': false,
      };

      for (var data in mixInputs.entries) {
        final pattern = regPatterns.username(minLength: 3);
        expect(pattern.hasMatch(data.key), data.value, reason: '${data.key} : ${pattern.message}');
      }
    });

    test('Username with allowSpace = true, minLength = 3, ', () {
      final mixInputs = {
        // input | result
        'JohnDoe': true,
        'user_name': true,
        'user-nam': true,
        'user.nam': true,
        'user/nam': true,
        'user.name12': true,
        'u': false,
        'Jo': false,
        'user@nam': false,
        'username!': false,
        ' usernam': false,
        'username ': false,
        'user nam': true,
        'John': true,
        'Jane Doe': true,
        'Alice Smith Johnson': false, //out of length
        'J': false,
        'John123': true,
        'John Doe Smith Johnson': false, //out of length
        'John Doe!': false,
      };

      for (var data in mixInputs.entries) {
        final pattern = regPatterns.username(minLength: 3, allowSpace: true);
        expect(pattern.hasMatch(data.key), data.value, reason: '${data.key} : ${pattern.message}');
      }
    });

    group('Email & Phone Number Testing', () {
      test('Email test', () {
        final emailTests = {
          'john.doe@example.com': true,
          'jane_doe123@sub.example.co.uk': true,
          'user+mailbox/department=shipping@example.com': true,
          'customer/department=shipping@example.com': true,
          '!def!xyz%abc@example.com': true,
          'user@localserver': false, // Invalid: missing domain
          'user@.com.my': false, // Invalid: domain starts with a dot
          'user.name@example.com': true,
          'user_name@sub.domain.com': true,
          'username@domain': false,
          'username@domain..com': false,
          'username@-domain.com': false,
          'username@domain.com-': false,
          'user@domain..com': false,
          'user@domain_com': false,
          'username@domain.toolongtld': true,
        };

        for (var data in emailTests.entries) {
          final pattern = regPatterns.email;
          expect(pattern.hasMatch(data.key), data.value, reason: '${data.key} : ${pattern.message}');
        }
      });
      test('Phone number test', () {
        final phoneNumberTests = {
          '+919876543210': true,
          '09876543210': true,
          '+91 98765 43210': false,
          '091-9876543210': false,
          '9876543210': true,
          '+1-8005551234': true,
          '+1-800-555-1234': false,
          '+44 20 7946 0958': false,
          '+81 3-1234-5678': false,
          '12345': false, // Invalid: Too short
          '12345678901234567890': false, // Invalid: Too long
          'abcd': false, // Invalid: Contains non-digit characters
          '+91-9876543210-123': false, // Invalid: Extra characters
          '+91.9876.543210': false, // Invalid: Invalid separator
          '9876 543210': false, // Invalid: Missing country code or leading zero
        };

        for (var data in phoneNumberTests.entries) {
          final pattern = regPatterns.phoneNumber;
          expect(pattern.hasMatch(data.key), data.value, reason: '${data.key} : ${pattern.message}');
        }
      });
    });
  });
}
