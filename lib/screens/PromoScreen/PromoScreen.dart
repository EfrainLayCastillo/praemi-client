import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/promo_grid_cubit/promo_grid_cubit.dart';
import 'package:praemiclient/repositories/promos_repository.dart';
import 'package:praemiclient/screens/PromoScreen/widgets/PromoGridView.dart';
import 'package:praemiclient/screens/ScanQRScreen/ScanQRScreen.dart';

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
              centerTitle: true,
              title: Image(
                image: AssetImage('assets/logoPraemi.png'),
                width: 120,
              ),
              backgroundColor: Color(0xFF073045),
              brightness: Brightness.dark,
              pinned: true,
              elevation: 2,
              forceElevated: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.qr_code_scanner), 
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(  builder: (context) => ScanQRScreen() )
                  ),
                )
              ],
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