import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/promo_grid_cubit/promo_grid_cubit.dart';
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/screens/PromosListScreen.dart/ItemPromoCard.dart';
import 'package:praemiclient/utils/CustomCircularLoadingIndicator.dart';

class PromoGridView extends StatefulWidget {
  PromoGridView({
    Key key,
  }) : super(key: key);

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
    var cellHeight = 320;
    var _aspectRatio = _width / cellHeight;
    print(_aspectRatio);

    return BlocBuilder<PromoGridCubit, PromoGridState>(
      builder: (context, state) {
        if (state is PromoGridInitial) return Center(child: CustomCircularLoadingIndicator());
        if (state is PromoGridLoad) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate((context, int index) {
              return ItemPromoCard(
                promosModel: state.promosList[index],
              );
            }, childCount: listPromosModel.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: _crossAxisSpacing,
                crossAxisCount: _crossAxisCount,
                childAspectRatio: _aspectRatio
            )
          );
        }
        return Center(child: CustomCircularLoadingIndicator());
      },
    );
  }
}
