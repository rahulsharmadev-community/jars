import 'package:equatable/equatable.dart';

abstract class _BaseBlocState<T> extends Equatable {
  const _BaseBlocState();

  /// Handles different BlocState types and executes the corresponding function.
  ///
  /// - Parameters:
  ///   - onInitial: Function to execute if the state is [BlocStateInitial].
  ///   - onSuccess: Function to execute if the state is [BlocStateSuccess].
  ///   - onFailure: Optional function to execute if the state is [BlocStateFailure].
  ///   - onLoading: Optional function to execute if the state is [BlocStateLoading].
  /// - Returns: The result of the function corresponding to the state type.
  R on<R>({
    required R onInitial,
    required R Function(BlocStateSuccess<T> state) onSuccess,
    R Function(BlocStateFailure<T> state)? onFailure,
    R Function(BlocStateLoading<T> state)? onLoading,
  }) {
    if (this is BlocStateFailure && onFailure != null) {
      return onFailure(this as BlocStateFailure<T>);
    } else if (this is BlocStateLoading && onLoading != null) {
      return onLoading(this as BlocStateLoading<T>);
    } else if (this is BlocStateSuccess) {
      return onSuccess(this as BlocStateSuccess<T>);
    } else {
      return onInitial;
    }
  }

  @override
  List<Object?> get props => [];
}

/// A abstract class for representing different states in a BLoC.
///
/// This class is used to define various states that a BLoC can be in,
/// such as initial, loading, success, or failure states.
abstract class BlocState<T> extends _BaseBlocState<T> {
  const BlocState();

  /// Checks if all elements in the provided list are of type `T`.
  static bool areAll<R extends BlocState>(List<BlocState> states) => states.every((state) => state is R);

  /// Checks if any element in the provided list is of type `T`.
  static bool isAny<R extends BlocState>(List<BlocState> states) => states.any((state) => state is R);

  /// Checks if the current state is an initial state.
  bool get isInitial => this is BlocStateInitial<T>;

  /// Checks if the current state is a loading state.
  bool get isLoading => this is BlocStateLoading<T>;

  /// Checks if the current state is a success state.
  bool get isSuccess => this is BlocStateSuccess<T>;

  /// Checks if the current state is a failure state.
  bool get isFailure => this is BlocStateFailure<T>;
}

/// Represents the initial state of a BLoC.
final class BlocStateInitial<T> extends BlocState<T> {}

/// Represents the loading state of a BLoC.
///
/// This state indicates that the BLoC is currently in a loading state,
/// typically while fetching data or performing an asynchronous operation.
final class BlocStateLoading<T> extends BlocState<T> {
  final String? message;

  const BlocStateLoading([this.message]);

  @override
  List<Object?> get props => [message];
}

/// Represents the success state of a BLoC.
///
/// This state indicates that the BLoC operation was successful,
/// and contains the resulting data of type [T].
final class BlocStateSuccess<T> extends BlocState<T> {
  final T data;
  final String? message;

  const BlocStateSuccess(this.data, {this.message});

  @override
  List<Object?> get props => [data, message];
}

/// Represents the failure state of a BLoC.
///
/// This state indicates that the BLoC operation encountered an error,
/// and contains an error message describing the failure.
final class BlocStateFailure<T> extends BlocState<T> {
  final String message;
  final Object? extra;

  const BlocStateFailure(this.message, {this.extra});

  @override
  List<Object?> get props => [message, this.extra];
}
