import 'package:flutter/material.dart';
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/models/user.dart';
import 'package:praemiclient/screens/DetailsPromoScreen/widgets/AppBarPromoDetails.dart';
import 'package:praemiclient/screens/DetailsPromoScreen/widgets/CreateCodeQRButton.dart';
import 'package:praemiclient/screens/DetailsPromoScreen/widgets/InfoPromoDetails.dart';

class DetailsPromoScreen extends StatelessWidget {
  final PromosModel promosModelItem;
  final User userD;
  const DetailsPromoScreen({Key key, @required this.promosModelItem, this.userD})
   : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        AppBarPromoDetails(
          height: _size.height * 0.52, 
          backgroundUrl: promosModelItem.images[0].src, 
          titleScreen: promosModelItem.name
        ),
        SliverToBoxAdapter(
          child: InfoPromoDetails(promosModelItem: promosModelItem),
        )
      ],
        ),
      floatingActionButton: CreateCodeQRButton(promosModel: promosModelItem, userBtn: userD),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}