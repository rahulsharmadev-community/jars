import 'dart:developer' as developer;

void _printFunction(
  String prefix,
  String value, {
  bool isError = false,
}) {
  developer.log('$prefix $value'.trim(), name: 'Utls');
}

void printError(Object object) {
  _printFunction('Error: ${object.runtimeType}', '$object', isError: true);
}

void printInfo(Object? object) {
  _printFunction('Info: ${object.runtimeType}', '$object', isError: false);
}
