import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/repositories/promos_repository.dart';

part 'promo_grid_state.dart';

class PromoGridCubit extends Cubit<PromoGridState> {
  final PromosRepository _promosRepository;
  PromoGridCubit(this._promosRepository) 
  : assert(_promosRepository != null), super(PromoGridInitial());

  Future<void> getPromosList() async {
    try {
      final List<PromosModel> promosList = await _promosRepository.getPromosListWooCommerce();
      emit(PromoGridLoad(promosList: promosList ));
    } on Exception {
      print('error al cargar la lista en el banner del home');
    }
  }
  
}
