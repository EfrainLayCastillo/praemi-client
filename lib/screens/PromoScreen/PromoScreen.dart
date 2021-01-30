import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/promo_grid_cubit/promo_grid_cubit.dart';
import 'package:praemiclient/models/models.dart';
import 'package:praemiclient/repositories/promos_repository.dart';
import 'package:praemiclient/screens/PromoScreen/widgets/PromoGridView.dart';
import 'package:praemiclient/utils/CustomAppBarPraemi.dart';

class PromoScreen extends StatelessWidget {
  final User userData;
  PromoScreen({ this.userData});

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
            CustomAppBarPraemi(),
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
