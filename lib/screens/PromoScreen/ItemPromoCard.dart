import 'package:flutter/material.dart';
import 'package:praemiclient/models/promos_model.dart';

class ItemPromoCard extends StatelessWidget {
  final PromosModel promosModel;

  ItemPromoCard({
    Key key,
    @required this.promosModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () => {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageItemPromo(imageSrc: promosModel.images[0].src),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.00, horizontal: 10.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContentItemPromo(
                      productName: promosModel.name,
                      productCategory: promosModel.categories[0].name),
                  Divider(
                    height: 20,
                    color: Colors.grey[400],
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  //StarDisplay(value: 4),
                  FooterItemPromo(reviwsCount: promosModel.ratingCount,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageItemPromo extends StatelessWidget {
  final String imageSrc;
  const ImageItemPromo({this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: 225.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          image: DecorationImage(
              image: NetworkImage(imageSrc), fit: BoxFit.cover)),
    );
  }
}

class ContentItemPromo extends StatelessWidget {
  final String productName;
  final String productCategory;
  const ContentItemPromo({this.productName, this.productCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productCategory.toUpperCase(),
          style: TextStyle(
              fontFamily: 'Raleway', fontSize: 13.0, color: Colors.grey),
        ),
        const SizedBox(height: 3.0),
        Text(
          productName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
              fontSize: 16.0),
        ),
      ],
    );
  }
}

class FooterItemPromo extends StatelessWidget {

  final int reviwsCount; 
  final double averageRating; 
  const FooterItemPromo({this.reviwsCount, this.averageRating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StarDisplay(value: 4),
        Text( '$reviwsCount reviews',
          style: TextStyle( fontFamily: 'Raleway', fontSize: 13.0, color: Colors.grey ),
        )
      ],
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(
        color: Colors.amber,
        size: 20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < value ? Icons.star : Icons.star_border,
          );
        }),
        
      ),
    );
  }
}
