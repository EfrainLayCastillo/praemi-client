import 'package:flutter/material.dart';

class PraemiTheme {

  PraemiTheme._();

  static Color colorPrimary = Color(0xFF033045);
  static Color colorSecondary = Color(0xff00f594);

  static Text titleh1({String text, double size = 26}) => Text( text, style: TextStyle(fontWeight: FontWeight.bold, color: colorPrimary, fontSize: size), textAlign: TextAlign.center );

  
}