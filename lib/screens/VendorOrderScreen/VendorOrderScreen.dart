import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/create_order_bloc/create_order_bloc.dart';
import 'package:praemiclient/screens/VendorOrderScreen/widgets/ButtonScanQR.dart';
import 'package:praemiclient/screens/VendorOrderScreen/widgets/EmptyOrder.dart';
import 'package:praemiclient/utils/CustomAppBarPraemi.dart';

class VendorOrderScreen extends StatelessWidget {
  const VendorOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _sizeScreen = MediaQuery.of(context).size;
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CreateOrderBloc()
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBarPraemi(),
            SliverToBoxAdapter(
              child: EmptyOrder(),
            )
          ],
        ),
        floatingActionButton: ButtonScanQR(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
      )
    );
  }
}