import 'package:flutter/material.dart';

class AppBarPromoDetails extends StatelessWidget {
  final double height;
  final String backgroundUrl;
  final String titleScreen;
  const AppBarPromoDetails({
    Key key, 
    @required this.height, 
    @required this.backgroundUrl, 
    @required this.titleScreen }) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = Theme.of(context).primaryColor;
    return SliverAppBar(
      stretch: true,
      expandedHeight: height,
      backgroundColor: mainColor,
      brightness: Brightness.dark,
      pinned: true,
      title: Text(''),
      flexibleSpace: BackgroundPromoDetails( bgPromoD: backgroundUrl),
    );
  }
}


class BackgroundPromoDetails extends StatelessWidget {
  final String bgPromoD;
  const BackgroundPromoDetails({Key key, this.bgPromoD}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Stack(
        fit: StackFit.expand,
        children: [
          FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage(bgPromoD),
            placeholder: AssetImage('assets/gifs/loader-image.gif')
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -3),
                end: Alignment(0.0, 0.0),
                colors: <Color>[
                  Color(0xaa000000),
                  Colors.transparent
                ],
              ),
            ),
          )
        ],
          
        )
    );
  }
}