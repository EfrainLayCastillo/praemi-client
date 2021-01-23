import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/promo_grid_cubit/promo_grid_cubit.dart';
import 'package:praemiclient/repositories/promos_repository.dart';
import 'package:praemiclient/screens/PromoScreen/PromoGridView.dart';

class PromoScreen extends StatelessWidget {
  final PromosRepository _promosRepository = new PromosRepository();
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [ 
        BlocProvider(
          create: (BuildContext context) => PromoGridCubit(_promosRepository)
        ) 
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Praemi',
              style: Theme.of(context).textTheme.headline6.copyWith( color: Colors.white )),
              backgroundColor: Theme.of(context).colorScheme.primary,
              brightness: Brightness.dark,
              pinned: true,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              sliver: PromoGridView(),
            )
          ],
        )
      )
    );
  }
}