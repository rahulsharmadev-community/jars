import '../local_extensions.dart';

extension DynamicExtensions on dynamic {
  @Deprecated('isNull is deprecated and cannot be used, use "==" operator')
  bool get isNull => LocalExtensions.isNull(this);

  @Deprecated(
      'isNullOrBlank is deprecated and cannot be used, use "isBlank" instead')
  bool? get isNullOrBlank => LocalExtensions.isNullOrBlank(this);
}
