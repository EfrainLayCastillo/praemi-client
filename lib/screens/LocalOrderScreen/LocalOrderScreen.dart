import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/scanner_valid_qr_bloc/scanner_qr_bloc.dart';
import 'package:praemiclient/screens/LocalOrderScreen/widgets/ButtonScanQR.dart';
import 'package:praemiclient/screens/LocalOrderScreen/widgets/EmptyOrder.dart';
import 'package:praemiclient/utils/CustomAppBarPraemi.dart';

class LocalOrderScreen extends StatelessWidget {
  const LocalOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _sizeScreen = MediaQuery.of(context).size;
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ScannerQrBloc()
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