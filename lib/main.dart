import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/SimpleBlocObserver.dart';
import 'package:praemiclient/screens/PromosListScreen.dart/PromoScreen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praemi App Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PromoScreen(),
    );
  }
}
