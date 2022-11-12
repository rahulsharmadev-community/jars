// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:jars/jars.dart';

void main() {
  test('DATETIME AGO TEST', () async {
    var oldDateTime = DateTime(2012, 6, 10);
    var yesterday = DateTime.now() - Duration(days: 1);
    yesterday.timeagoSince();
    Duration(days: 1).timeagoSince();
    var t1 = Timeago.since(oldDateTime, code: 'zh-CH');
    var t2 = Timeago.since(oldDateTime, code: 'hi');

    print('Timeago: ${t1.format()}');
    print('Timeago: ${t1.format(isFull: true)}');
    print('Timeago: ${t1.format(isFull: true, yearFormat: (p0) => p0.yMMM())}');
    print(
        'Timeago: ${t1.format(isFull: true, yearFormat: (p0) => p0.yMMM(isFull: true))}');
    print(
        'Timeago: ${t1.format(isFull: true, yearFormat: (p0) => p0.yMMMEd())}');
    print(
        'Timeago: ${t1.format(isFull: true, yearFormat: (p0) => p0.yMMMEd(isFull: true))}\n');

    print('Timeago: ${t2.format()}');
    print('Timeago: ${t2.format(isFull: true, yearFormat: (p0) => p0.yMMM())}');
    print(
        'Timeago: ${t2.format(isFull: true, yearFormat: (p0) => p0.yMMMEd())}');
    print(
        'Timeago: ${t2.format(isFull: true, yearFormat: (p0) => p0.yMMMEd(isFull: true))}');

    print('============================================');
    var f1 = DateTimeFormat(oldDateTime);
    var f2 = DateTimeFormat(oldDateTime, code: 'hi');

    print('DateTime Format Test-1: ${f1.yMd()}');

    print('DateTime Format Test-1: ${f1.yMEd()}');
    print('DateTime Format Test-1: ${f1.yMEd(isFull: true)}');
    print('DateTime Format Test-1: ${f2.yMEd()}');
    print('DateTime Format Test-1: ${f2.yMEd(isFull: true)}\n');

    print('DateTime Format Test-2: ${f1.yMMM()}');
    print('DateTime Format Test-2: ${f1.yMMM(isFull: true)}');
    print('DateTime Format Test-2: ${f2.yMMM()}');
    print('DateTime Format Test-2: ${f2.yMMM(isFull: true)}\n');

    print('DateTime Format Test-3: ${f1.yMMMEd()}');
    print('DateTime Format Test-3: ${f1.yMMMEd(isFull: true)}');
    print('DateTime Format Test-3: ${f2.yMMMEd()}');
    print('DateTime Format Test-3: ${f2.yMMMEd(isFull: true)}\n');

    print('DateTime Format Test-4: ${f1.yMMMd()}');
    print('DateTime Format Test-4: ${f1.yMMMd(isFull: true)}');
    print('DateTime Format Test-4: ${f2.yMMMd()}');
    print('DateTime Format Test-4: ${f2.yMMMd(isFull: true)}\n');
  });
}
