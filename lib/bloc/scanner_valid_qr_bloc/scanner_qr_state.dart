part of 'scanner_qr_bloc.dart';

abstract class ScannerQrState extends Equatable {
  const ScannerQrState();
  
  @override
  List<Object> get props => [];
}

class ScannerQrInitial extends ScannerQrState {}

class SQrLoading extends ScannerQrState {}

class SQrFailed extends ScannerQrState {}

class SQrSuccessValidCode extends ScannerQrState {
  final String dataCodeQrModel;
  const SQrSuccessValidCode({this.dataCodeQrModel});

  SQrSuccessValidCode copyWith({String dataCodeQrModel}) {
    return SQrSuccessValidCode(dataCodeQrModel: dataCodeQrModel?? this.dataCodeQrModel);
  }

  @override
  List<Object> get props => [dataCodeQrModel];

  @override
  String toString() => 'DataCodeQrModel Encoded: $dataCodeQrModel';
}

class SQrSuccessOrderCreated extends ScannerQrState {}
