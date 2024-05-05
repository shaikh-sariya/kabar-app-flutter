import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

/// Custom BlocObserver for observing and logging Bloc events and state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    // Log the creation of a Bloc instance.
    if (kDebugMode) {
      print(bloc);
    }
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // Log state changes within a Bloc.
    if (kDebugMode) {
      print(change);
    }
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    // Log the occurrence of an event within a Bloc.
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    // Log transitions between states within a Bloc.
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    // Log the closing of a Bloc instance.
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // Log errors that occur within a Bloc.
    super.onError(bloc, error, stackTrace);
  }
}
