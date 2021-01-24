import 'package:flutter/material.dart';
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/screens/DetailsPromoScreen/widgets/TitleInfo.dart';
import 'package:praemiclient/utils/utilsFn.dart';

class InfoPromoDetails extends StatelessWidget {
  final PromosModel promosModelItem;
  const InfoPromoDetails({Key key, this.promosModelItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _averageRating = double.parse(promosModelItem.averageRating);
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          _CategoryName(nameCategory: promosModelItem.categories[0].name),
          TitleInfo(
            name: promosModelItem.name,
            numOfReviews: promosModelItem.ratingCount != 0 ? promosModelItem.ratingCount: 10,
            averageRating: _averageRating != 0 ? _averageRating : 4,
            price: 15,
          ),
          Divider(
            height: 20,
            color: Colors.grey[400],
            thickness: 0.5,
            indent: 5,
            endIndent: 5,
          ),
          const SizedBox(height: 10),
          Text(
            UtilsFn.removeAllHtmlTags(promosModelItem.description), 
            style: TextStyle( height: 1.5, color: Colors.black87, fontSize: 16),
          ),
          SizedBox(height: size.height * 0.3),
          // Free space  10% of total height
        ],
      ),
    );
  }
}

class _CategoryName extends StatelessWidget {
  final String nameCategory;
  const _CategoryName({Key key, this.nameCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorMain = Theme.of(context).primaryColor;
    return Row(
      children: <Widget>[
        Icon( Icons.layers, color: colorMain),
        const SizedBox(width: 10),
        Text(nameCategory, style: TextStyle(color: colorMain)),
      ],
    );
  }
}

