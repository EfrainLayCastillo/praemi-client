import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarPraemi extends StatelessWidget {
  final List<Widget> actionsWidgets;
  const CustomAppBarPraemi({Key key, this.actionsWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: SvgPicture.asset( 'assets/praemiLogo-1.svg', width: 150 ),
      backgroundColor: Theme.of(context).primaryColor,
      brightness: Brightness.dark,
      pinned: true,
      elevation: 2,
      forceElevated: true,
      actions: actionsWidgets,
    );

    
  }  
}
