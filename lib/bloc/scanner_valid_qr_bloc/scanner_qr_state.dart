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
  final DataCodeQrModel dataCodeQrModel;
  const SQrSuccessValidCode({this.dataCodeQrModel});

  SQrSuccessValidCode copyWith({DataCodeQrModel dataCodeQrModel}) {
    return SQrSuccessValidCode(dataCodeQrModel: dataCodeQrModel?? this.dataCodeQrModel);
  }

  @override
  List<Object> get props => [dataCodeQrModel];

  @override
  String toString() => 'Lista Cargada de Promociones: ${dataCodeQrModel.userId}';
}

class SQrSuccessOrderCreated extends ScannerQrState {}
