import 'package:flutter_test/flutter_test.dart';
import 'package:jars/jars.dart';
import 'package:jars/resources/src/timeago.dart';

void main() async {
  test('DATETIME AGO TEST', () {
    var oldDateTime = DateTime(2012, 6, 10);
    var t1 = Timeago.since(oldDateTime);
    var t2 = Timeago.since(oldDateTime, lang: 'hi');
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
    var f2 = DateTimeFormat(oldDateTime, lang: 'hi');

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
