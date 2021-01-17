import 'package:flutter/material.dart';
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/screens/PromosListScreen.dart/ItemPromoCard.dart';

class PromoGridView extends StatefulWidget {
  
  PromoGridView({Key key,}) : super(key: key);

  @override
  _PromoGridViewState createState() => _PromoGridViewState();
}

class _PromoGridViewState extends State<PromoGridView> {
  @override
  void initState() {
    super.initState();
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
    var _width = ( _screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var cellHeight = 320;
    var _aspectRatio = _width /cellHeight;
    print(_aspectRatio);

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, int index) {
        return ItemPromoCard (
          promosModel: listPromosModel[index],
        );
      }, 
      childCount: listPromosModel.length
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10, 
        crossAxisSpacing: _crossAxisSpacing,
        crossAxisCount: _crossAxisCount,
        childAspectRatio: _aspectRatio
      )
    );
  }
  
}