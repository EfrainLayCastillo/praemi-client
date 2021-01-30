import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scanner_qr_event.dart';
part 'scanner_qr_state.dart';

class ScannerQrBloc extends Bloc<ScannerQrEvent, ScannerQrState> {
  ScannerQrBloc() : super(ScannerQrInitial());

  @override
  Stream<ScannerQrState> mapEventToState(
    ScannerQrEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
