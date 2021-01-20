import 'package:flutter/material.dart';
import 'package:praemiclient/models/promos_model.dart';

class ItemPromoCard extends StatelessWidget {

final PromosModel promosModel;

  ItemPromoCard( {Key key, @required this.promosModel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCoffeeItem(
      productName: promosModel.name,
      price: '33',
      productType: promosModel.categories[0].name,
      imgPath: promosModel.images[0].src,
    );
  }
}


_buildCoffeeItem({String imgPath, String productName, String productType, String price}) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        width: 225.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4.0,
              blurRadius: 4.0
            )
          ]
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 140.0,
                  width: 225.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                      image: NetworkImage(imgPath),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8),
                  child: Text(
                    productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8),
                  child: Text(productType,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 14.0,
                    color: Colors.grey
                  ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 0.4,
                    color: Colors.grey.withOpacity(0.4),
                  )
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$' + price,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2)
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.grey
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }