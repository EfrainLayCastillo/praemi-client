import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:praemiclient/models/data_code_qr_model.dart';
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
   
  }

  Stream<ScannerQrState> _mapValidQrDataToState(String dataResultEncode) async* {
    yield SQrLoading();
    try {
      bool isValid = await _scannerValidQrRespository.validQrDataFn(dataResultEncode);
      
      if(isValid){ 
        yield SQrSuccessValidCode(dataCodeQrModel: dataResultEncode);
      }
      else throw Exception;

    } catch (e) {
      print(e);
      yield SQrFailed();
    }
  }

}
