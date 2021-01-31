import 'package:flutter/material.dart';

class CustomAppBarPraemi extends StatelessWidget {
  
  final Widget widgetScreen;
  const CustomAppBarPraemi({Key key, this.widgetScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Image(
        image: AssetImage('assets/logoPraemi.png'),
        width: 120,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      brightness: Brightness.dark,
      pinned: true,
      elevation: 2,
      forceElevated: true,
    );
  }
}