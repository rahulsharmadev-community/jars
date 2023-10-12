
import 'package:jars/extensions.dart';

class Schedule {
  final String name;
  final DateTime start;
  final DateTime end;

  const Schedule(this.name, this.start, this.end);

  static Schedule? formName(String name) {
    switch (name.toLowerCase()) {
      case 'morning':
        return morning;
      case 'afternoon':
        return afternoon;
      case 'evening':
        return evening;
      case 'night':
        return night;
      default:
        null;
    }
    return null;
  }

  @override
  String toString() =>
      '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}${start.period.name} - '
      '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}${end.period.name}';

  static Schedule get morning => Schedule(
      'Morning', DateTime(0000, 0, 0, 11, 59), DateTime(0000, 0, 0, 11, 59));
  static Schedule get afternoon => Schedule(
      'Afternoon', DateTime(0000, 0, 0, 12, 00), DateTime(0000, 0, 0, 16, 59));
  static Schedule get evening => Schedule(
      'Evening', DateTime(0000, 0, 0, 17, 00), DateTime(0000, 0, 0, 19, 59));
  static Schedule get night => Schedule(
      'Night', DateTime(0000, 0, 0, 20, 00), DateTime(0000, 0, 0, 05, 59));
}
