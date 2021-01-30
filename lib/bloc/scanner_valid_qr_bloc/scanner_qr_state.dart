part of 'scanner_qr_bloc.dart';

abstract class ScannerQrState extends Equatable {
  const ScannerQrState();
  
  @override
  List<Object> get props => [];
}

class ScannerQrInitial extends ScannerQrState {}

class SQrLoading extends ScannerQrState {}

class SQrFailed extends ScannerQrState {}

class SQrSuccessValidCode extends ScannerQrState {}

class SQrSuccessOrderCreated extends ScannerQrState {}
