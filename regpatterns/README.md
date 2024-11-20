We are excited to introduce the RegPatterns package, a powerful tool for working with regular expressions in Dart. RegPatterns was originally designed to complement the [Jars package](https://pub.dev/packages/jars), enhancing its capabilities. However, we are pleased to inform you that RegPatterns can also be used as a standalone package, allowing you to leverage its features without any dependencies on the [Jars package](https://pub.dev/packages/jars).

## Key Features of RegPatterns

- **`RegPatterns.binaryDigits([allowEmpty = false])`**
  
    This function creates a regular expression pattern for binary digits (0 and 1) \
    Parameter `allowEmpty` is optional and determines whether the pattern allows for an empty string (default is `false`).

      ```dart
       /// Example usage:
            RegPatterns.binaryDigits(); // Consists only of 0 & 1 
            RegPatterns.binaryDigits(true); // Consists only of 0 & 1, allows empty string 
      ```
- **`RegPatterns.octalDigits([allowEmpty = false])`**
    
    This function creates a regular expression pattern for octal digits (0 to 7). \
    Parameter `allowEmpty` is optional and determines whether the pattern allows for an empty string (default is `false`).

    ```dart
     /// Example usage:
          RegPatterns.octalDigits(); // Consists only of 0 to 7
          RegPatterns.octalDigits(true); // Consists only of 0 to 7, allows empty string
    ```
- **`RegPatterns.decimalDigits([allowEmpty = false])`**

    This function creates a regular expression pattern for decimal digits (0 to 9). \
    Parameter `allowEmpty` is optional and determines whether the pattern allows for an empty string (default is `false`).
    
    ```dart
     /// Example usage:
          RegPatterns.octalDigits(); // Consists only of 0 to 9
          RegPatterns.octalDigits(true); // Consists only of 0 to 9, allows empty string
      ```
- **`RegPatterns.hexDecimalDigits([allowEmpty = false])`**
  
    This function creates a regular expression pattern for hexDecimal digits (0 to F). \
    Parameter `allowEmpty` is optional and determines whether the pattern allows for an empty string (default is `false`).
    
    ```dart
     /// Example usage:
          RegPatterns.hexDecimalDigits(); // Consists only of 0 to F
          RegPatterns.hexDecimalDigits(true); // Consists only of 0 to F, allows empty string
      ```
- `RegPatterns.creditCard`
  
    This function creates a regular expression pattern for checking invalid credit/debit card formats.
    ```dart
    RegPatterns.creditCard // Check for invalid credit/debit card format
    ```
- `RegPatterns.password`
  
    Password validation based on the specified `PasswordType`. The function supports various password types, including requirements for   minimum and maximum length, whether whitespace is allowed, and custom failure messages.

    ```dart
       // - [type]: The desired [PasswordType] for the password pattern.
       // - [minLength]: The minimum length required for the password (default is 8).
       // - [maxLength]: The maximum length required for the password (default is 24).
       // - [allowWhitespace]: Determines if whitespace characters are allowed in the    password    (default   is false).
       // - [failedMessage]: An optional custom message to display when password   validation fails.
       static RegPatterns password(
         PasswordType type, {
         int minLength = 8,
         int maxLength = 24,
         allowWhitespace = false,
         String? failedMessage,
         })
      ```
- The `PasswordType` enumeration explanation:
  - **`ALL_CHARS_UPPER_LOWER_NUM_SPECIAL`**:
    - **Description:** Allowing all characters with the requirement of at least 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character (symbol).
    - **Message:** "Allowing all characters with Requires at least: 1 uppercase & 1 lowercase letter, 1 number, & 1 special character."

  - **`ALL_CHARS_UPPER_LOWER_NUM`**:
    - **Description:** Allowing all characters with the requirement of at least 1 uppercase letter, 1 lowercase letter, and 1 number.
    - **Message:** "Allowing all characters with Requires at least: 1 uppercase & 1 lowercase letter, 1 number."

  - **`ALL_CHAR_LETTER_NUM`**:
    - **Description:** Allowing all characters with the requirement of at least 1 letter and 1 number.
    - **Message:** "Allowing all characters with Requires at least: 1 letter & 1 number."

  - **`ONLY_LETTER_NUM`**:
    - **Description:** Allowing only letters and numbers.
    - **Message:** "Allowing only letters & numbers."

  - **`ANY_CHAR`**:
    - **Description:** Allows all characters without specific character requirements.
    - **Message:** "Allows all characters without specific character requirements."


## Usage

```dart
import 'package:regpatterns/regpatterns.dart';

void main() {
  var result = RegPatterns.binaryDigits().hasMatch('10101');
  print('Boolean state: $result');
}

```
