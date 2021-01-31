part of 'scanner_qr_bloc.dart';

abstract class ScannerQrEvent extends Equatable {
  const ScannerQrEvent();

  @override
  List<Object> get props => [];
}

class CreateOrder extends ScannerQrEvent {}

class ValidQrData extends ScannerQrEvent {

  final String dataResult;

  const ValidQrData({ @required this.dataResult});

  @override
  List<Object> get props => [dataResult];

  @override
  String toString() => 'Data scan code Qr : { type :$dataResult }';
}