import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_blc/bloc/internet/internet_event.dart';
import 'package:flutter_blc/bloc/internet/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetBloc() : super(InitialState()) {
    on<InternetLossEvent>((event, emit) => emit(InternetLossState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLossEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    // TODO: implement close
    return super.close();
  }
}
