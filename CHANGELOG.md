## 0.0.6

🎉 Upgrade to [`jars ^0.0.6`](https://pub.dev/packages/jars)

- **BREAKING-CHANGE**

  - ✅ This release includes following stable new widgets
  
    - `Gap`: A widget designed to render a fixed empty space, useful for layout spacing.
    - `InfoJDialog`: A dialog widget designed to present informative messages and content.
    - `AlertJDialog`: This dialog includes interactive buttons, allowing for increased user engagement.
    - `SelectJDialog`: A dialog widget that facilitates the selection of options or items.
    - `SlideMenuButton`: A new widget featuring a popup menu button, enhancing menu navigation.
    - `FloatingTextField`: An innovative floating text field widget, ideal for efficient search functionality.
  
  - 🔄️ In this release, we've introduced a set of experimental widgets that are not considered stable yet. These widgets are intended for experimentation and testing purposes:

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
