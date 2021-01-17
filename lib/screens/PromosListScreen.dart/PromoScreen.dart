import 'package:flutter/material.dart';
import 'package:praemiclient/screens/PromosListScreen.dart/PromoGridView.dart';

class PromoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Praemi',
                style: Theme.of(context).textTheme.headline6.copyWith( color: Colors.white )),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              brightness: Brightness.dark,
              pinned: true,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              sliver: PromoGridView(),
            ),
          ],
        )
    );
  }
}