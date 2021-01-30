import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:praemiclient/models/models.dart';

class LocalScreen extends StatelessWidget {
  final User userData;
  const LocalScreen({Key key, this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: Center(
          child: Text('Role: ${userData.roles}'),
        ),
      ),
    );
  }
}
