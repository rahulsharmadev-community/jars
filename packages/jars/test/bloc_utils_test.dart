import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:jars/jars.dart';

Future<({T output, int ms})> asyncDelayCount<T>(Future<T> Function() fun) async {
  final start = DateTime.now();
  final output = await fun();
  final end = DateTime.now();
  return (output: output, ms: end.difference(start).inMilliseconds);
}

void main() {
  group('Event Transformers', () {
    test('delay transformer', () async {
      final transformer = delay<int>(const Duration(milliseconds: 100));
      final input = Stream.periodic(const Duration(milliseconds: 50), (i) => i).take(5);
      final output = transformer(input, (event) => Stream.value(event));

      final result = await asyncDelayCount(() => output.toList());

      expect(result.ms > 350 && result.ms < 400, isTrue);
      expect(result.output, [0, 1, 2, 3, 4]);
    });

    test('debounce transformer', () async {
      final transformer = debounce<int>(const Duration(milliseconds: 500));
      var tests = [
        (count: 10, result: [9], time: 2500),
        (count: 5, result: [4], time: 1250),
        (count: 3, result: [2], time: 750),
      ];
      for (var test in tests) {
        final input = Stream.periodic(const Duration(milliseconds: 250), (i) => i).take(test.count);
        final output = transformer(input, (event) => Stream.value(event));
        final result = await asyncDelayCount(() => output.toList());
        expect(result.output, test.result);
        var processing_margin = 100;
        expect(result.ms >= test.time && result.ms < test.time + processing_margin, isTrue,
            reason: 'Expected:${test.time}\nActual:${result.ms}');
      }
    });

    test('skip transformer', () async {
      final transformer = skip<int>(50);
      var list = List.generate(100, (i) => i);
      final input = Stream.fromIterable(list);
      final output = transformer(input, (event) => Stream.value(event));
      final result = await output.toList();
      expect(result, list.skip(50));
    });

    test('throttle transformer', () async {
      final transformer = throttle<int>(const Duration(milliseconds: 100));
      var tests = [
        (count: 10, result: [0, 2, 4, 6, 8], time: 1000),
        (count: 5, result: [0, 2, 4], time: 600),
        (count: 3, result: [0, 2], time: 400),
      ];
      for (var test in tests) {
        final input = Stream.periodic(const Duration(milliseconds: 100), (i) => i).take(test.count);
        final output = transformer(input, (event) => Stream.value(event));
        final result = await asyncDelayCount(() => output.toList());
        expect(result.output, test.result);
        var processing_margin = 50;
        expect(result.ms >= test.time && result.ms < test.time + processing_margin, isTrue,
            reason: 'Expected:${test.time}\nActual:${result.ms}');
      }
    });
  });
}
