<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# JARS

## Leave a 👍 like if you like it

---

# Installing

Add Get to your pubspec.yaml file:

```yaml
dependencies:
  jars:
    git: https://github.com/rahulsharmadev-community/jars
```

Import get in files that it will be used:

```dart
import 'package:jars/jars.dart';
```

# PlatformQuery APIs

```dart
  /// Device's Orientation
  /// Similar to MediaQuery.of(context).orientation;
  PlatformQuery.orientation;

  // Platform display/screen Height
  // Equivalent to : MediaQuery.of(context).size.height,
  // but immutable.
  PlatformQuery.height;


  // Platform display/screen Width
  // Equivalent to : MediaQuery.of(context).size.height,
  // but immutable.
  PlatformQuery.width

  // The aspect ratio of platform display/screen size.
  // Equivalent to : MediaQuery.of(context).aspectRatio,
  // but immutable.
  PlatformQuery.aspectRatio

  // Platform display/screen Pixel Ratio
  // Equivalent to : MediaQuery.of(context).pixelRatio,
  // but immutable.
  PlatformQuery.pixelRatio

  /// Respective percentage of the viewport's smaller dimension.
  20.vmin;

  /// Respective percentage of the viewport's larger dimension.
  20.vmax;

  /// Calculates the height depending on the device's screen size
  20.h; // -> will return 20% of the screen's height

  /// Calculates the width depending on the device's screen size
  20.w // -> will return 20% of the screen's width

  /// Calculates the sp (Scalable Pixel) depending on the device's pixel
  /// density and aspect ratio
  14.sp // general use for fontsize

  /// Calculates the material dp (Pixel Density)
  /// (https://material.io/design/layout/pixel-density.html#pixel-density-on-android))
  16.dp // generally use for font, image and icons size.

  //Check in what platform the app is running
  PlatformQuery.isAndroid
  PlatformQuery.isIOS
  PlatformQuery.isMacOS
  PlatformQuery.isWindows
  PlatformQuery.isLinux
  PlatformQuery.isFuchsia

  //Check the device type
  PlatformQuery.isMobileorTablet
  PlatformQuery.isDesktop

  // Return an current platform, any one of them
  // web,
  // android,
  // fuchsia,
  // iOS,
  // linux,
  // macOS,
  // windows
  PlatformQuery.activePlatform

  /* [Window size](https://medium.com/@rahulsharmadev/responsive-design-theory-b8f18b257295)
Window size classes categorize the display area available to your app as compact,medium, or expanded. Available width and height are classified separately,so at any point in time, your app has two window size classes — one for width, one for /height. */
  //
  // Retun any one of them { compact, medium, expanded }
  PlatformQuery.activeWindowSize

  /// How to use?
  /// -------------------------------
  /// PlatformQueryBuilder(
  ///     builder: (ctx) {
  ///       String string =
  ///           'Hello <${TextStyle(color: Colors.red, fontSize: 20.sp,
  ///            backgroundColor: Colors.orange).toTextPlusStyle} = "World 😂"> I am hear.';
  ///       return TextPlus(string);
  ///     },
  ///   ),
  /// );
  ///--------------------------------
  /// **Recommendation to use it LESS**
  PlatformQueryBuilder(builder: (context) {
          return Widget;
        });

```

# DateTimeFormat APIs

It allows the user to choose from a set of standard date time formats with customized syntex.

Easy to use

````dart
 var date= DateTimeFormat(DateTime.now(),seprator: '/');
 print(date.yMMMd());

 Output ___________________
 |                         |
 |  Oct 30, 2022           |
 |_________________________|
````

For make it more easy to use, now you don't need to create a DateTimeFormat class object before using. look at the example below.

```dart

  var today = DateTime.now(); // Create an Object

  // Whether this time of day is before or after noon.
  // return DayPeriod.am | DayPeriod.pm;
  today.period;

  /// Which hour of the current period (e.g., am or pm) this time is.
  ///
  /// For 12AM (midnight) and 12PM (noon) this returns 12.
  today.hourOfPeriod ;

  /// The hour at which the current period starts.
  today.periodOffset;


  /// Equal to: (month / 4).round();
  /// eg. (6/4).round() = 2
  today.quarter;

  /// Example:
  //   yMEd()=> Sun, 10/30/2022
  //   yMEd(isFull: true) => Sunday, 10/30/2022
  today.format('/').yMEd();
```

| Pattern              |     | Result                   |
| -------------------- | --- | ------------------------ |
| yM()                 | ->  | 10/2022                  |
| yMd()                | ->  | 10/30/2022               |
| yMEd()               | ->  | Sun, 10/30/2022          |
| yMEd(isFull: true)   | ->  | Sunday, 10/30/2022       |
| yMMM()               | ->  | Oct 2022                 |
| yMMM(isFull: true)   | ->  | October 2022             |
| yMMMd()              | ->  | Oct 30, 2022             |
| yMMMd(isFull: true)  | ->  | October 30, 2022         |
| yMMMEd()             | ->  | Sun, Oct 30, 2022        |
| yMMMEd(isFull: true) | ->  | Sunday, October 30, 2022 |
| yQQQ()               | ->  | Q4 2022                  |
| yQQQ(isFull: true)   | ->  | 4th quarter 2022         |
| hm()                 | ->  | 02:37                    |
| hm()                 | ->  | 2:37 AM                  |
| hms()                | ->  | 02:37:31                 |
| hms(isFull: true)    | ->  | 2:37:31 AM               |
