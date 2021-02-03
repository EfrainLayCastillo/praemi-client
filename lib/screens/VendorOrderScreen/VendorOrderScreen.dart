import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:praemiclient/bloc/create_order_bloc/create_order_bloc.dart';
import 'package:praemiclient/repositories/scanner_valid_qr_repository.dart';
import 'package:praemiclient/screens/VendorOrderScreen/widgets/ButtonScanQR.dart';
import 'package:praemiclient/screens/VendorOrderScreen/widgets/EmptyOrder.dart';
import 'package:praemiclient/utils/CustomAppBarPraemi.dart';
import 'package:praemiclient/utils/DialogCustom.dart';
import 'package:praemiclient/utils/SnackBarCustom.dart';

class VendorOrderScreen extends StatelessWidget {
  final ScannerValidQrRespository scannerValidQrRespository =
      new ScannerValidQrRespository();
  VendorOrderScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _sizeScreen = MediaQuery.of(context).size;

    return BlocProvider(
        create: (BuildContext context) =>
            CreateOrderBloc(scannerValidQrRespository),
        child: Scaffold(
          body: BlocListener<CreateOrderBloc, CreateOrderState>(
            listener: (context, state) {
              if (state is SuccessOrderCreated) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return DialogCustom(
                        title: "",
                        message: "ORDEN CREADA",
                        textBtn: "Cerrar",
                        pathImage: "assets/gifs/success-animation.gif",
                        onPressed: () => Navigator.of(context).pop(),
                      );
                    });
              }
              if (state is CreateOrderFailed) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBarCustom.snackBar(
                        msg: 'Error al crear la orden',
                        actionWg: Icon(Icons.error_outline),
                        bgColor: Colors.red),
                  );
              }
            },
            child: Scaffold(
                body: CustomScrollView(
                  //Disabled scrolling
                  // `const NeverScrollableScrollPhysics(),`
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    CustomAppBarPraemi(
                      actionsWidgets: [
                        IconButton(
                            icon: Icon(Icons.logout),
                            onPressed: () {
                              context
                                  .read<AuthenticationBloc>()
                                  .add(LoggedOut());
                            })
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: EmptyOrder(),
                    )
                  ],
                ),
                floatingActionButton: ButtonScanQR(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat),
          ),
        ));
  }
}
