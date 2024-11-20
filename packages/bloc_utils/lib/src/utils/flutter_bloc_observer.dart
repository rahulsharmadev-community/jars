import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

final class FlutterBlocObserver extends BlocObserver {
  final bool enabled;
  final bool printEvents;
  final bool printTransitions;
  final bool printChanges;
  final bool printEventFullData;
  final bool printStateFullData;
  final bool printCreations;
  final bool printClosings;
  final bool Function(Bloc bloc, Transition transition)? transitionFilter;
  final bool Function(Bloc bloc, Object? event)? eventFilter;
  final Logger _logger;

  FlutterBlocObserver({
    Logger? logger,
    this.enabled = true,
    this.printEvents = true,
    this.printTransitions = true,
    this.printChanges = false,
    this.printEventFullData = true,
    this.printStateFullData = true,
    this.printCreations = false,
    this.printClosings = false,
    this.transitionFilter,
    this.eventFilter,
  }) : _logger = logger ?? Logger();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logIfAllowed(
      condition: enabled && printEvents,
      filter: eventFilter?.call(bloc, event) ?? true,
      message: () => _formatEventLog(bloc, event),
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logIfAllowed(
      condition: enabled && printTransitions,
      filter: transitionFilter?.call(bloc, transition) ?? true,
      message: () => _formatTransitionLog(bloc, transition),
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logIfAllowed(
      condition: enabled && printChanges,
      filter: true,
      message: () => _formatChangeLog(bloc, change),
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.e('${bloc.runtimeType} encountered an error', error: error, stackTrace: stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _logIfAllowed(
      condition: enabled && printCreations,
      filter: true,
      message: () => '${bloc.runtimeType} created',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _logIfAllowed(
      condition: enabled && printClosings,
      filter: true,
      message: () => '${bloc.runtimeType} closed',
    );
  }

  //
  //-------------- Helper to check conditions and log messages-------
  //
  void _logIfAllowed({
    required bool condition,
    required bool filter,
    required String Function() message,
  }) {
    if (condition && filter) _logger.i(message());
  }

  // Formatting helpers
  String _formatEventLog(Bloc bloc, Object? event) {
    return printEventFullData
        ? '${bloc.runtimeType} received event:\n$event'
        : '${bloc.runtimeType} received event: ${event.runtimeType}';
  }

  String _formatTransitionLog(Bloc bloc, Transition transition) {
    return '${bloc.runtimeType} with event ${transition.event.runtimeType} '
        'CURRENT state: ${_stateRepresentation(transition.currentState)} '
        'NEXT state: ${_stateRepresentation(transition.nextState)}';
  }

  String _formatChangeLog(BlocBase bloc, Change change) {
    return '${bloc.runtimeType} changed '
        'CURRENT state: ${_stateRepresentation(change.currentState)} '
        'NEXT state: ${_stateRepresentation(change.nextState)}';
  }

  String _stateRepresentation(Object state) {
    return printStateFullData ? '\n$state' : state.runtimeType.toString();
  }
}
