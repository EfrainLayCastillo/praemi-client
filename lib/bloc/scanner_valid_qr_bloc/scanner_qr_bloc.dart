import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:praemiclient/repositories/scanner_valid_qr_repository.dart';

part 'scanner_qr_event.dart';
part 'scanner_qr_state.dart';

class ScannerQrBloc extends Bloc<ScannerQrEvent, ScannerQrState> {
  final ScannerValidQrRespository _scannerValidQrRespository;

  ScannerQrBloc(this._scannerValidQrRespository) 
  : assert(_scannerValidQrRespository != null), super(ScannerQrInitial());

  @override
  Stream<ScannerQrState> mapEventToState( ScannerQrEvent event) async* {
    if (event is ValidQrData ) { 
      yield* _mapValidQrDataToState(event.dataResult); 
    }
    else if (event is CreateOrder) { 
      yield* _mapCreateOrderToState(); 
    }
  }

  Stream<ScannerQrState> _mapValidQrDataToState(String dataResult) async* {
    yield SQrLoading();
    try {
      bool isValid = await _scannerValidQrRespository.validQrDataFn(dataResult);
      print('CODE QR IS VALID??? $isValid');
      if(isValid) yield SQrSuccessValidCode();
      else throw Exception;

    } catch (e) {
      print(e);
      yield SQrFailed();
    }
  }

  Stream<ScannerQrState> _mapCreateOrderToState() async* {
    yield SQrLoading();
    try {
      bool isGuest =  true;

      if(isGuest) yield SQrSuccessOrderCreated();
      else throw Exception;

    } catch (e) {
      print(e);
      yield SQrFailed();
    }
  }

}
