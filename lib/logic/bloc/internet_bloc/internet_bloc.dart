import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription<List<ConnectivityResult>> subscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>(
      (event, emit) {
        if (event is ConnectedEvent) {
          emit(ConnectedState(message: "Connected"));
        } else if (event is NotConnectedEvent) {
          emit(NotConnectedState(message: "Not Connected"));
        }
      },
    );
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
