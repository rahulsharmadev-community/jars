import 'package:flutter_bloc/flutter_bloc.dart' show BlocBase, Change;
import 'bloc_selective_consumer.dart';

/// A mixin to manage state visibility in a [Bloc] or [Cubit].
///
/// This mixin is used to filter out states that should not be stored as the
/// previous state. It provides a mechanism to retrieve the last visible state.
/// States marked with [DroppableState] will not be retained.
mixin DroppableMixin<T> on BlocBase<T> {
  /// The last state that was not hidden by the [DroppableState] filter.
  T? _previousState;

  /// Retrieves the previous state of type [A] if it exists.
  ///
  /// This method checks if the last state matches the specified type [A].
  ///
  /// Returns:
  ///   - The previous state of type [A] if it matches, or
  ///   - `null` if it doesn't match or if there is no previous state.
  A? onPreviousState<A>() => _previousState is A ? _previousState as A : null;

  @override
  void onChange(Change<T> change) {
    super.onChange(change);
    if (change.nextState is! DroppableState) {
      _previousState = change.nextState;
    }
  }
}
