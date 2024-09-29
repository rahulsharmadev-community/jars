import 'package:flutter_bloc/flutter_bloc.dart';

sealed class SelectiveState {}

/// BlocStates that should trigger listening only.
abstract interface class ListenOnlyState extends SelectiveState{}

/// BlocStates that should trigger building only.
abstract interface class BuildOnlyState extends SelectiveState{}

/// BlocStates that should never trigger listeners.
abstract interface class NeverListenState extends SelectiveState{}

/// BlocStates that should not be saved & build.
abstract interface class DroppableState extends SelectiveState{}



/// {@template bloc_selective_consumer}
/// A specialized [BlocConsumer] that listens to and builds widgets based on state,
/// with customizable filters to ignore certain states.
///
/// This class provides default filtering behavior using marker interfaces such as
/// [ListenOnlyState], [BuildOnlyState], [NeverListenState], and [DroppableState].
///
/// For example, states marked with [NeverListenState] will not trigger listeners,
/// and states marked with [DroppableState] will be ignored for building.
/// {@endtemplate}
class BlocSelectiveConsumer<B extends StateStreamable<S>, S> extends BlocConsumer<B, S> {
  /// {@macro bloc_selective_consumer}
  const BlocSelectiveConsumer({
    super.key,
    required super.builder,
    required super.listener,
    super.bloc,
  }) : super(listenWhen: _listenWhen, buildWhen: _buildWhen);

  // Customizes when the listener should be triggered based on state type.
  static bool _listenWhen<S>(S previous, S current) {
    if (current is NeverListenState || current is BuildOnlyState) return false;
    return true;
  }

  // Customizes when the builder should rebuild the UI based on state type
  static bool _buildWhen<S>(S previous, S current) {
    if (current is DroppableState || current is ListenOnlyState) return false;
    return true;
  }
}
