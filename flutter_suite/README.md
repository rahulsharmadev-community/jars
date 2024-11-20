<div>
  <h1 align="center">JARS</h1>
  <p align="center" >
    <a title="Github License">
    <a href="https://pub.dev/packages/flutter_suite"><img src="https://img.shields.io/pub/v/flutter_suite?color=blue&label=pub.dev" alt="Pub Version"></a>
    <a href="https://pub.dev/packages/flutter_suite/license"><img src="https://img.shields.io/github/license/rahulsharmadev-community/flutter_suite?label=%20LICENSE%20%F0%9F%AA%B6" alt="GitHub"></a>
  </p>
  <p align="center">
  Leave a 👍 like if you like it
  </p>
</div>

JARS is a super-effective and lightweight solution for Flutter. It combines front-end flutter widgets, intelligent dependency injection, and provider solutions like. **[Timeago](#timeago), [showJTost](#JToast--JSnackBar), [removeJTost](#JToast--JSnackBar), [showJSnackBar](#JToast--JSnackBar), [removeJSnackBar](#JToast--JSnackBar), [Marquee](#Marquee), [FormBuilder](), [SmartJTextField](), [DateTimeJTextField](), [JTextField](), [guard](), [asyncGuard](), [RegPatterns]()**

- ### [How to install](https://pub.dev/packages/flutter_suite/install)
- ### [See how to use](https://github.com/rahulsharmadev-community/flutter_suite/tree/master/example)

- ### Supported platforms: Android | iOS | Web | MacOs | Windows | Linux

# BlocSelectiveConsumer
A specialized [BlocConsumer] that listens to and builds widgets based on state, with customizable filters to ignore certain states.

This class provides default filtering behavior using marker interfaces such as `ListenOnlyState`, `BuildOnlyState`, `NeverListenState`, and `DroppableState`.

# DroppableMixin
A mixin to manage state visibility in a `Bloc` or `Cubit`.

This mixin is used to filter out states that should not be stored as the previous state. Itprovides a mechanism to retrieve the last visible state. States marked with `DroppableState` willnot be retained.


#  BlocEventTransformer
Skip implementing transformers on your own and configure timings in which events in your BLoC's are processed.

Available transformers:

- [throttle](https://pub.dev/documentation/bloc_event_transformers/latest/bloc_event_transformers/throttle.html) (see [visualization](https://rxmarbles.com/#throttleTime))
- [debounce](https://pub.dev/documentation/bloc_event_transformers/latest/bloc_event_transformers/debounce.html) (see [visualization](https://rxmarbles.com/#debounceTime))
- [skip](https://pub.dev/documentation/bloc_event_transformers/latest/bloc_event_transformers/skip.html) (see [visualization](https://rxmarbles.com/#skip))
- [delay](https://pub.dev/documentation/bloc_event_transformers/latest/bloc_event_transformers/delay.html) (see [visualization](https://rxmarbles.com/#delay))

# Replay

## Creating a ReplayCubit

```dart
class CounterCubit extends ReplayCubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}
```

## Using a ReplayCubit

```dart
void main() {
  final cubit = CounterCubit();

  // trigger a state change
  cubit.increment();
  print(cubit.state); // 1

  // undo the change
  cubit.undo();
  print(cubit.state); // 0

  // redo the change
  cubit.redo();
  print(cubit.state); // 1
}
```

## ReplayCubitMixin

If you wish to be able to use a `ReplayCubit` in conjuction with a different type of cubit like `HydratedCubit`, you can use the `ReplayCubitMixin`.

```dart
class CounterCubit extends HydratedCubit<int> with ReplayCubitMixin {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  int fromJson(Map<String, dynamic> json) => json['value'] as int;

  @override
  Map<String, int> toJson(int state) => {'value': state};
}
```

## Creating a ReplayBloc

```dart
class CounterEvent extends ReplayEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends ReplayBloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}
```

## Using a ReplayBloc

```dart
void main() {
  // trigger a state change
  final bloc = CounterBloc()..add(CounterIncrementPressed());

  // wait for state to update
  await bloc.stream.first;
  print(bloc.state); // 1

  // undo the change
  bloc.undo();
  print(bloc.state); // 0

  // redo the change
  bloc.redo();
  print(bloc.state); // 1
}
```

## ReplayBlocMixin

If you wish to be able to use a `ReplayBloc` in conjuction with a different type of cubit like `HydratedBloc`, you can use the `ReplayBlocMixin`.

```dart
sealed class CounterEvent with ReplayEvent {}

final class CounterIncrementPressed extends CounterEvent {}

final class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends HydratedBloc<CounterEvent, int> with ReplayBlocMixin {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }

  @override
  int fromJson(Map<String, dynamic> json) => json['value'] as int;

  @override
  Map<String, int> toJson(int state) => {'value': state};
}
```

# Marquee
A Flutter widget that scrolls text infinitely. Provides many customizations including custom scroll directions, durations, curves as well as pauses after every round.

<p align="center">
  <img src="https://raw.githubusercontent.com/rahulsharmadev-community/flutter_suite/beta/_readme_assets/Marquee.gif" height=700>
</p>

```dart
Marquee(
            maxHeight: 50,
            scrollAxis: Axis.horizontal,
            accelerationCurve: Curves.fastLinearToSlowEaseIn,
            pauseAfterRound: 3.seconds,
            blankSpace: 10,
            velocity: 100,
            child: const FlutterLogo(
                size: 100, style: FlutterLogoStyle.horizontal),
          ),
          Marquee(
            maxHeight: 50,
            blankSpace: 50,
            child: JTextPlus(
                '<r>Marquee</r> is a flutter widget that scrolls widget infinitely.',
                jTextStyles: [JTextStyle('r', color: Colors.red)]),
          )
```

# JToast & JSnackBar

With JSnackBar and JToast it is now easier than ever to show a little notification to the user. It may appear on the screen in any direction, including the top, bottom, center, and so on.

- In the true sense of JToast & JSnackBar, you can call it whenever you need it, without any restrictions!
- Feature-rich, support for displaying notifications, text, loading, attachments, etc. JToast & JSnackBar
- Support for popping up various custom JToasts & JSnackBars, or you can pop up any Widget as long as it meets the requirements of the flutter code.
- API is simple and easy to use
- Pure flutter implementation

<p align="center">
  <img src="https://raw.githubusercontent.com/rahulsharmadev-community/flutter_suite/beta/_readme_assets/rsnakbar.gif" height=700>
</p>

```dart
 // RTost Demo
 OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form top center.',
              config: JToastConfig(alignment: Alignment.topCenter)),
          child: const Text('TOP CENTER'),
        );

// JSnackBar Demo
  simpleTile('Simple Loading Snackbar',
    onPressed: () =>
        showJSnackBar(context, config: JSnackBarLoadingConfig('Loading')),
    onDismissed: () => removeJSnackBar()),

```

# Timeago

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

## DateTime Extension

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

# How to contribute

Want to contribute to the project? We will be proud to highlight you as one of our collaborators.
Here are some points where you can contribute and make Get (and Flutter) even better.

- Adding documentation to the readme (a lot of Jars features haven't been documented yet).
- Write articles or make videos teaching how to use Jars.
- Including new functions class.

Any contribution is welcome!
