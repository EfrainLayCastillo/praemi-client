part of 'scanner_qr_bloc.dart';

abstract class ScannerQrEvent extends Equatable {
  const ScannerQrEvent();

  @override
  List<Object> get props => [];
}

class CreateOrder extends ScannerQrEvent {}