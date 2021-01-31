part of 'create_order_bloc.dart';

abstract class CreateOrderEvent extends Equatable {
  const CreateOrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderCalled extends CreateOrderEvent {

  final DataCodeQrModel dataCodeQrModel;

  const CreateOrderCalled({ @required this.dataCodeQrModel});

  @override
  List<Object> get props => [dataCodeQrModel];

  @override
  String toString() => 'Data Code Qr Model : { type :${dataCodeQrModel.promoId} }';
}