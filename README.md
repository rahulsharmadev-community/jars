<div>
  <h1 align="center">JARS</h1>
  <p align="center" >
    <a title="Github License">
    <a href="https://pub.dev/packages/jars"><img src="https://img.shields.io/pub/v/jars?color=blue&label=pub.dev" alt="Pub Version"></a>
    <a href="https://pub.dev/packages/jars/license"><img src="https://img.shields.io/github/license/rahulsharmadev-community/jars?label=%20LICENSE%20%F0%9F%AA%B6" alt="GitHub"></a>
  </p>
  <p align="center">
  Leave a 👍 like if you like it
  </p>
</div>

JARS is a super-effective and lightweight solution for Flutter. It combines front-end flutter widgets, intelligent dependency injection, and provider solutions like. **[DateTimeApis](#datetime-apis), [DateTimeFormat](#datetimeformat), [DateTimeLang](#datetimelang), [Timeago](#timeago), [PlatformQuery](#platformquery-apis), [showRTost](#rtoast--rsnackbar), [removeRTost](#rtoast--rsnackbar), [showRSnackBar](#rtoast--rsnackbar), [removeRSnackBar](#rtoast--rsnackbar), [printInfo](), [printError](), [JMarquee](#jmarquee), [JTextPlus](#jtextplus)**

- ### [How to install](https://pub.dev/packages/jars/install)
- ### [See how to use](https://github.com/rahulsharmadev-community/jars/tree/master/example)

- ### Supported platforms: Android | iOS | Web | MacOs | Windows | Linux

# JTextPlus

As we all know, text is a key component of any mobile app's user interface. and it is fustrating to use Text or RichText Widget to create attractive text. Now you no longer need to define multiple TextStyle for attractive text thanks to JTextPlus' simple solution for text decoration. You'll save time and get fantastic results with JTextPlus.

![](https://raw.githubusercontent.com/rahulsharmadev-community/jars/beta/_readme_assets/jtextplus.png)

**How to Use**

```dart
 JTextPlus(
            text,
            style: const TextStyle(
                fontSize: 25, color: Colors.white, letterSpacing: 1.5),
            jTextStyles: rules2,
          );
```

# JMarquee

A Flutter widget that scrolls text infinitely. Provides many customizations including custom scroll directions, durations, curves as well as pauses after every round.

<p align="center">
  <img src="https://raw.githubusercontent.com/rahulsharmadev-community/jars/beta/_readme_assets/jmarquee.gif" height=700>
</p>

```dart
JMarquee(
            maxHeight: 50,
            scrollAxis: Axis.horizontal,
            accelerationCurve: Curves.fastLinearToSlowEaseIn,
            pauseAfterRound: 3.seconds,
            blankSpace: 10,
            velocity: 100,
            child: const FlutterLogo(
                size: 100, style: FlutterLogoStyle.horizontal),
          ),
          JMarquee(
            maxHeight: 50,
            blankSpace: 50,
            child: JTextPlus(
                '<r>JMarquee</r> is a flutter widget that scrolls widget infinitely.',
                jTextStyles: [JTextStyle('r', color: Colors.red)]),
          )
```

# RToast & RSnackBar

With RSnackBar and RToast it is now easier than ever to show a little notification to the user. It may appear on the screen in any direction, including the top, bottom, center, and so on.

- In the true sense of RToast & RSnackBar, you can call it whenever you need it, without any restrictions!
- Feature-rich, support for displaying notifications, text, loading, attachments, etc. RToast & RSnackBar
- Support for popping up various custom RToasts & RSnackBars, or you can pop up any Widget as long as it meets the requirements of the flutter code.
- API is simple and easy to use
- Pure flutter implementation

<p align="center">
  <img src="https://raw.githubusercontent.com/rahulsharmadev-community/jars/beta/_readme_assets/rsnakbar.gif" height=700>
</p>

```dart
 // RTost Demo
 OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form top center.',
              config: RToastConfig(alignment: Alignment.topCenter)),
          child: const Text('TOP CENTER'),
        );

// RSnackBar Demo
  simpleTile('Simple Loading Snackbar',
    onPressed: () =>
        showRSnackBar(context, config: RSnackbarLoadingConfig('Loading')),
    onDismissed: () => removeRSnackBar()),

```

# DateTime APIs

Most popular datetime apis are:

- **[DateTimeFormat](#datetimeformat)**
- **[DateTimeLang](#datetimelang)**
- **[Timeago](#timeago)**

## DateTimeFormat

The user can choose from a variety of standard date and time formats as well as a particular customised pattern. Additionally, by using Datetimelang, the user can specify a local language, such as Hindi, Punjabi, Chines, etc.

Example

```dart

 var now = DateTime.now();

 // default code = 'en'(English)
 var datedef = DateTimeFormat(now);

 // code = 'hi'(Hindi)
 var datehi = DateTimeFormat(now, code: 'hi');

// 1st
 print(datedef.yMMMEd());
 print(datedef.yMMMEd(isFull: true));

// 2st
 print(datehi.yMMMd());
 print(datehi.yMMMd(isFull: true));


 Output _________________________
 |
 |  Oct 30, 2022
 |  Saturday, June 10, 2012
 |
 |  शनि, जून 10, 2012
 |  शनिवार, जून 10, 2012
 |_______________________________
```

| Pattern              |     | Result                   |
| -------------------- | --- | ------------------------ |
| yM()                 | ->  | 10/2022                  |
| yMd()                | ->  | 10/30/2022               |
| yMEd()               | ->  | Sun, 10/30/2022          |
| yMEd(isFull: true)   | ->  | Sunday, 10/30/2022       |
| yMMM()               | ->  | Oct 2022                 |
| yMMM(isFull: true)   | ->  | October 2022             |
| yMMd()               | ->  | 30 Oct 2022              |
| yMMd(isFull: true)   | ->  | 30 October 2022          |
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

## DateTimeLang

For more control over datetime language you may can create your own JSON file, load it into the datetimelang api, and then set it as a default language.

```dart

   /// **Load file locally **
   await DateTimeLang.loadFromFile(CODE: 'fr', path: 'lib/assets/fr.json');

   /// **Load file form Url**
   //
   /// Under the hood, **English & Hindi** are already available.
   ///
   /// Chinese (zh-CN): https://datetimelangs-default-rtdb.asia-southeast1.firebasedatabase.app/zh-CH.json
   ///
   /// French (fr): https://datetimelangs-default-rtdb.asia-southeast1.firebasedatabase.app/fr.json
   ///
   /// Afrikaans (af): https://datetimelangs-default-rtdb.asia-southeast1.firebasedatabase.app/af.json

   await DateTimeLang.loadFromUrl(
        CODE: 'zh-CH',
        url:'https://datetimelangs-default-rtdb.asia-southeast1.firebasedatabase.app/zh-CH.json');


   // Now that you have both languages, choose a default language.
   DateTimeLang.setDefaultLang('zh-CH');

   var now = DateTimeFormat(DateTime.now());
   print(now.yMMMd(isFull: true));

   // To make it straightforward and appealing, you can,
   // however, directly access the format() function.
   print(DateTime.now().format().yMMM());


 Output _________________________
 |
 |  十一月 10, 2022
 |  十一月 2022
 |_______________________________

```

## Timeago

Timeago is a dart library that converts a date into a humanized text. Instead of showing a date 2020-12-12 18:30 with timeago you can display something like "now", "an hour ago", "~1y", etc. By default Timeago ONLY support 'en' and 'hi' code(language code).To add more of the supported languages use [DateTimeLang class](#datetimelang)

```dart

 var oldDateTime = DateTime(2012, 6, 10);
    var t1 = Timeago.since(oldDateTime);
    var t2 = Timeago.since(oldDateTime, code: 'hi');

    // en
    print(t1.format());
    print(t1.format(isFull: true));
    print(t1.format(isFull: true, yearFormat: (p0) => p0.yMMMEd()));
    print(t1.format(isFull: true, yearFormat: (p0) => p0.yMMMEd(isFull: true)));

    // hi
    print(t2.format());
    print(t2.format(isFull: true, yearFormat: (p0) => p0.yMMMEd()));
    print(t2.format(isFull: true, yearFormat: (p0) => p0.yMMMEd(isFull: true)));


 Output _________________________
 |
 |  10 Yr ago
 |  10 Years ago
 |  Sat, Jun 10, 2012
 |  Saturday, June 10, 2012
 |
 |  10 वर्षों पूर्व
 |  शनि, जून 10, 2012
 |  शनिवार, जून 10, 2012
 |_______________________________
```

## DateTime APIs Extension

```dart

  var today = DateTime.now(); // Create an Object

  // now you can use operator like -, *, +, /, >=, <, >
  var yesterday = DateTime.now() - Duration(days: 2);
  var duration=Duration(hours: 2, minutes: 3, seconds: 2) // Create an Object

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

  // 2 Days ago
  yesterday.timeagoSince();

 // 2 Hours ago
  duration.timeagoSince();
 // 02:03:02
  duration.hms();

  // Equal to: (duration.inMonths / 12).round();
  duration.inYears;
  // Equal to:(duration.inDays / 30.4167).round();
  duration.inMonths;
  // Equal to: (duration.inDays / 7).round();
  duration.inWeeks;

  // Equal to: Future.delayed(duration);
  duration.delay();

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

# How to contribute

Want to contribute to the project? We will be proud to highlight you as one of our collaborators.
Here are some points where you can contribute and make Get (and Flutter) even better.

- Adding documentation to the readme (a lot of Jars features haven't been documented yet).
- Write articles or make videos teaching how to use Jars.
- Including new functions class.

Any contribution is welcome!
