import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc() : super(CreateOrderInitial());

  @override
  Stream<CreateOrderState> mapEventToState( CreateOrderEvent event) async* {
    if (event is CreateOrder) { 
      yield* _mapCreateOrderToState(); 
    }
  }

  Stream<CreateOrderState> _mapCreateOrderToState() async* {
    yield CreateOrderLoading();
    try {
      bool isGuest =  true;

      if(isGuest) yield CreateOrderSuccessOrderCreated();
      else throw Exception;

    } catch (e) {
      print(e);
      yield CreateOrderFailed();
    }
  }

}
