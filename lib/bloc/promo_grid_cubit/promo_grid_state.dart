part of 'promo_grid_cubit.dart';

@immutable
abstract class PromoGridState extends Equatable {
  const PromoGridState();
  @override
  List<Object> get props => [];
}

class PromoGridInitial extends PromoGridState {}

class PromoGridLoad extends PromoGridState {

  final List<PromosModel> promosList;
  const PromoGridLoad({this.promosList});

  PromoGridLoad copyWith({List<PromosModel> promosList}) {
    return PromoGridLoad(promosList: promosList ?? this.promosList);
  }

  @override
  List<Object> get props => [promosList];

  @override
  String toString() => 'Lista Cargada de Paquetes sugeridos: ${promosList.length}';
}