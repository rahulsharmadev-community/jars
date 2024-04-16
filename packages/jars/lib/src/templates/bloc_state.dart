import 'package:equatable/equatable.dart';

/// A sealed class for representing different states in a BLoC.
///
/// This class is used to define various states that a BLoC can be in,
/// such as initial, loading, success, or failure states.
sealed class BlocState<T> extends Equatable {
  const BlocState();

  @override
  List<Object?> get props => [];
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

  const BlocStateFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Use this method for easy checking the current state of BlocState.
///
/// This method takes a type parameter `T` which extends from [BlocState].
/// It checks if the provided all instance of type `T`.
///
/// Example:
/// ```
/// void processStates(List<BlocState> states) {
///   if (isBlocState<BlocStateSuccess>(states)) {
///     // All states are success states, process them accordingly
///     final successStates = states.cast<BlocStateSuccess>();
///     for (final state in successStates) {
///       print('Success: ${state.data}');
///     }
///   } else {
///     print('Not all states are success states.');
///   }
/// }
///
/// void main() {
///   final states = <BlocState>[
///     BlocStateSuccess('Data 1'),
///     BlocStateSuccess('Data 2'),
///   ];
///
///   processStates(states); // Output: Success: Data 1, Success: Data 2
///
///   states.add(BlocStateLoading());
///
///   processStates(states);  // Output: Not all states are success states.
///
/// }
/// ```
bool isBlocState<T extends BlocState>(List<BlocState> ls) => ls.every((e) => e is T);
