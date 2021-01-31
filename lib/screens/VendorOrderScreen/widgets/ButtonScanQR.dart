
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/create_order_bloc/create_order_bloc.dart';
import 'package:praemiclient/screens/ScanQRScreen/ScanQRScreen.dart';
import 'package:praemiclient/utils/SnackBarCustom.dart';

class ButtonScanQR extends StatelessWidget {
  
  const ButtonScanQR({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<CreateOrderBloc, CreateOrderState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 53,
          child: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => _navigateAndDisplaySelection(context, state),
            label: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: 
              (state is CreateOrderLoading) ?
              isLoadingButton(context) :
              Text(
                'Escanear código QR'.toUpperCase(), 
                style: TextStyle(color: Colors.white, letterSpacing: 0.9) 
              ),
            ),
            icon: (state is CreateOrderLoading) ? 
              const SizedBox(height: 1) :
              Icon( Icons.qr_code_scanner_outlined, size: 25, color: Color(0xff00f594)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            heroTag: 'rrrr555',
          ),
        );
      });
  }

    // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context, CreateOrderState state) async {
    String resultData = await Navigator.push(
      context, MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => ScanQRScreen()
      ),
    );
    BlocProvider.of<CreateOrderBloc>(context).add(CreateOrderCalled(dataCodeQrModel: resultData));
  }


   Widget isLoadingButton(BuildContext context) {
    
    return Platform.isIOS ? CupertinoActivityIndicator() : Container(
      height: 22, width: 22,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white, 
        valueColor: AlwaysStoppedAnimation<Color> (Color(0xff00f594)), 
        strokeWidth: 2 
      ),
    );
  }
  
}