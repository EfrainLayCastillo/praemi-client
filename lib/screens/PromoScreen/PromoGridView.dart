import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/promo_grid_cubit/promo_grid_cubit.dart';
import 'package:praemiclient/screens/PromoScreen/ItemPromoCard.dart';
import 'package:praemiclient/utils/CustomCircularLoadingIndicator.dart';

class PromoGridView extends StatefulWidget {
  PromoGridView({ Key key}) : super(key: key);
  @override
  _PromoGridViewState createState() => _PromoGridViewState();
}

class _PromoGridViewState extends State<PromoGridView> {
  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PromoGridCubit>(context).getPromosList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 5.0;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 340;
    var _aspectRatio = _width / cellHeight;
    print(_aspectRatio);

    return BlocBuilder<PromoGridCubit, PromoGridState>(
      builder: (context, state) {
        if (state is PromoGridInitial) return LoadingSliverAdapter();
        if (state is PromoGridLoad) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                return ItemPromoCard( promosModel: state.promosList[index] );
              }, 
              childCount: state.promosList.length
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: _crossAxisSpacing,
                crossAxisSpacing: _crossAxisSpacing,
                crossAxisCount: _crossAxisCount,
                childAspectRatio: _aspectRatio
            )
          );
        }
        return LoadingSliverAdapter();
      },
    );
  }
}

class LoadingSliverAdapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CustomCircularLoadingIndicator()
        ),
      )
    );
  }
}
