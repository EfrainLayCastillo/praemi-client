import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:praemiclient/models/data_code_qr_model.dart';
import 'package:praemiclient/repositories/scanner_valid_qr_repository.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final ScannerValidQrRespository _scannerValidQrRespository;

  CreateOrderBloc(this._scannerValidQrRespository)
      : super(CreateOrderInitial());

  @override
  Stream<CreateOrderState> mapEventToState(CreateOrderEvent event) async* {
    if (event is CreateOrderCalled) {
      yield* _mapCreateOrderToState(event.dataCodeQrModel);
    }
  }

  Stream<CreateOrderState> _mapCreateOrderToState(
      String dataResultEncoded) async* {
    yield CreateOrderLoading();
    try {
      DataCodeQrModel dataCodeQrModel = await _scannerValidQrRespository
          .convertStringtoDataModelFn(dataResultEncoded);
      print('DATA CONVERTED: ${dataCodeQrModel.userId}');
      bool isGuest =
          await _scannerValidQrRespository.createOrderByUser(dataCodeQrModel);
      print(isGuest);
      if (isGuest)
        yield SuccessOrderCreated();
      else
        throw Exception;
    } catch (e) {
      print(e);
      yield CreateOrderFailed();
    }
  }
}
