import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircularLoadingIndicator extends StatelessWidget {
  const CustomCircularLoadingIndicator(
      {Key key, double wContent, double hContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActivityIndicator()
        : Container(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          );
  }
}