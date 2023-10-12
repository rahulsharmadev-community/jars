## 0.0.7

### 🎉 Upgrade to [`jars ^0.0.7`](https://pub.dev/packages/jars)

### BREAKING-CHANGE

✅ Permanently Removed `JTextPlus` (Not-Stable) Widget
  - In this release, we have made the decision to permanently remove the JTextPlus widget. This widget was not stable and has been removed from the library.

✅ This release includes following stable new widgets add Features
  - **`FormBuilder`** is a versatile widget that simplifies form building in Flutter applications. It offers a range of features to streamline the process of creating and managing forms.
  - **`SmartJTextField`** is a powerful widget that includes two essential sub-widgets:
    - `SmartJTextField.autoCompleteField()`: This widget provides auto-complete functionality, enhancing user input experiences by suggesting  options as users type.
    - `SmartJTextField.dropdownField`: This widget adds a dropdown functionality to text fields, allowing users to select options from a   predefined list.

  - **`DateTimeJTextField`** is a specialized widget designed for handling date and time input within your Flutter applications. It simplifies the selection of date and time values in forms.

  - **`JTextField`** is a fundamental widget that provides a customizable text input field for various use cases in your Flutter projects.
  - **`Marquee`** (stable): The Marquee widget is designed for creating scrolling text or widget animations.
  - **`guard`**:  Function wrapping the body with try/catch and returns default value if error was raised or return value is null
  - **`asyncGuard`**: Function asynchonically wrapping the body with try/catch and returns default value if error was raised or return value is null

✅ Add new usfull functions in `RegPatterns`
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


**Other Improvements and Changes**
- Additional enhancements, bug fixes, and performance optimizations have been made to improve the overall functionality and reliability of our library.




## 0.0.6

🎉 Upgrade to [`jars ^0.0.6`](https://pub.dev/packages/jars)

**BREAKING-CHANGE**

- ✅ This release includes following stable new widgets

  - `Gap`: A widget designed to render a fixed empty space, useful for layout spacing.
  - `InfoJDialog`: A dialog widget designed to present informative messages and content.
  - `AlertJDialog`: This dialog includes interactive buttons, allowing for increased user engagement.
  - `SelectJDialog`: A dialog widget that facilitates the selection of options or items.
  - `SlideMenuButton`: A new widget featuring a popup menu button, enhancing menu navigation.
  - `FloatingTextField`: An innovative floating text field widget, ideal for efficient search functionality.

- 🔄️ In this release, we've introduced a set of experimental widgets that are not considerestable yet. These widgets are intended for experimentation and testing purposes:

  - `JTextPlus` (not-stable): This widget offers unique text-related features and functionalities that are still under development and  refinement. Feel free to explore and experiment with it, but please be aware that it may not be suitable for production use at this time.

  - `Marquee` (not-stable): The Marquee widget is designed for creating scrolling text or widget animations. While it offers intriguing     possibilities, it is labeled as not stable, indicating that it is still in the experimental phase and may undergo changes or improvements in    future releases. Use it cautiously in your projects.

- ✅ Add `ReCase` extensions on `String`
  - `"jars new update".reCase.camelCase` ⇨ *jarsNewUpdate*
  - `"jars new update".reCase.constantCase` ⇨ *JARS_NEW_UPDATE*
  - `"jars new update".reCase.sentenceCase` ⇨ *Jars new update*
  - `"jars new update".reCase.snakeCase` ⇨ *jars_new_update*
  - `"jars new update".reCase.titleCase` ⇨ *Jars New Update*
  - *.......more*

- ✅ New `isToday` method on `DateTime` class, which returns a boolean value.
- ✅ Added New methods in WidgetExtensions on Widget:
    - **`expandBox`**: A convenience method that wraps the widget with `SizedBox.expand`, making it occupy all available space.
    - **`squareBox([double? dimension])`**: Creates a square-shaped container using `SizedBox.square`. You can optionally specify the `dimension` for the square.
    - **`curvedBox([double radius = 8])`**: Wraps the widget with a `ClipRRect` widget, applying rounded corners to it with the specified `radius`.
    - **`circleBox()`**: Similar to `curvedBox`, but creates a circular container by applying a large radius.
    - **`opacity(double opacity, {Key? key, bool alwaysIncludeSemantics = false, Widget? child})`**: Adds an `Opacity` widget to the child, allowing you to control its transparency.
    - **`paddingAll(double padding)`**: Applies equal padding to all sides of the widget using a `Padding` widget.
    - **`paddingHorizontal([double value = 0.0])`**: Adds horizontal padding using a `Padding` widget.
    - **`paddingVertical([double value = 0.0])`**: Adds vertical padding using a `Padding` widget.
    - **`paddingOnly({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0})`**: Provides fine-grained control over padding by specifying values for individual sides.
   - **`wSliverBox`**: A property that allows you to easily insert the widget inside a `SliverToBoxAdapter` for use within a `CustomScrollView`.
- ✅ Add usefull extensions on `Text` and `Widget`
- ✅ Removed boilerplate code
- ✅ Fix and refactor `DateTimeLang`, `Timeago`, `Schedule`, `FilesFormat` 


✅ Fix documentation

## 0.0.5

🎉 Upgrade to [`jars ^0.0.5`]((https://pub.dev/packages/jars))

- ✅ Fix documentation

## 0.0.4

🎉 Upgrade to [`jars ^0.0.4`](https://pub.dev/packages/jars)

- ✅ Extensions Upgrade
- ✅ Upgrade documentation

## 0.0.3

🎉 Upgrade to [`jars ^0.0.3`](https://pub.dev/packages/jars)

- ✅ JTextPlus Widget Added
- ✅ JMarquee Widget Added
- ✅ Upgrade DateTime API
- ✅ Upgrade documentation

## 0.0.2

🎉 Upgrade to [`jars ^0.0.2`](https://pub.dev/packages/jars)

- ✅ Fix documentation

## 0.0.1
