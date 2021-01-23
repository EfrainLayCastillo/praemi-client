import 'package:flutter/material.dart';

class AppBarPromoDetails extends StatelessWidget {
  final double height;
  final String backgroundUrl;
  final String titleScreen;
  const AppBarPromoDetails({Key key, @required this.height, @required this.backgroundUrl, @required this.titleScreen }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      backgroundColor: Colors.blue[800],
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
      background: Container(
        child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage(bgPromoD),
            placeholder: AssetImage('assets/gifs/loader-image.gif')
        )
      )
    );
  }
}