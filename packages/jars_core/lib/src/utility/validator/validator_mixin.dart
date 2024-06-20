import 'package:jars_core/jars_core.dart';
import 'package:meta/meta.dart';

mixin ValidatorMixin {
  @nonVirtual
  bool isValid([bool reThrow = false]) {
    return validator.guard(def: false, reThrow: reThrow);
  }

  @protected
  void validator();
}
