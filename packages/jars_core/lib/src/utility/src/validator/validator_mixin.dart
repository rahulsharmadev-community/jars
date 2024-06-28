import 'package:jars_core/jars_core.dart';
import 'package:meta/meta.dart';

mixin ValidatorMixin {
  @nonVirtual
  bool isValid([bool reThrow = false, void Function(dynamic)? onError]) {
    return validator.guardSafe(reThrow: reThrow, onError: onError);
  }

  @protected
  void validator();
}
