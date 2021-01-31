import 'package:flutter/material.dart';

class SnackBarCustom {

  SnackBarCustom._();

  static SnackBar snackBar({ String msg, Widget actionWg, Color bgColor = Colors.blueGrey }){
    
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded( flex: 9, child: Text(msg, maxLines: 2,)),
          Expanded( flex: 1, child: actionWg ),
          ],
      ),
      backgroundColor: bgColor,
    );
  }

}