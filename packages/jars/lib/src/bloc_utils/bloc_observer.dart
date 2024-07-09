import 'package:bloc/bloc.dart';
import 'package:jars/jars.dart';

class FlutterBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    _log('onCreate', bloc);
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    _log('onClose', bloc);
    super.onClose(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _log('onEvent', bloc);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _log('onChange', bloc, change.nextState);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _log('onTransition', bloc, transition.nextState);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logError(bloc, error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  void _log(String action, BlocBase bloc, [dynamic nextState]) {
    final logData = {
      'BLOC': bloc.runtimeType.toString(),
      'ACTION': action,
      'CURRENT STATE': bloc.state.toString(),
      'NEXT STATE': nextState?.toString()
    };
    log.i(logData);
  }

  void _logError(BlocBase bloc, Object error, StackTrace stackTrace) {
    final logData = {
      'BLOC': bloc.runtimeType.toString(),
      'ERROR': error.toString(),
      'STACK TRACE': stackTrace.toString()
    };
    log.e(logData);
  }
}
