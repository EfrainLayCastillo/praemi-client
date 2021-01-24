import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TitleInfo extends StatelessWidget {
  
  final int price, numOfReviews;
  final double averageRating;
  final String name;

  const TitleInfo({
    Key key,
    this.name,
    this.averageRating,
    this.numOfReviews,
    this.price,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text( name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      color: Colors.amber,
                      borderColor: Colors.amber,
                      rating: averageRating,
                      isReadOnly: true,
                    ),
                    const SizedBox(width: 10),
                    Text("$numOfReviews reviews", 
                    style: TextStyle( color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ),
          priceTag(context, price: price),
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context, {int price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 65,
        width: 55,
        color: Colors.blue[800],
        // child: Text(
        //   "\$$price",
        //   style: Theme.of(context).textTheme.headline6.copyWith(
        //     color: Colors.white, 
        //     fontWeight: FontWeight.bold
        //   ),
        // ),
        child: Icon(Icons.storefront, color: Colors.white, size: 30),
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}