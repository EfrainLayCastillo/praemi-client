import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praemiclient/bloc/scanner_valid_qr_bloc/scanner_qr_bloc.dart';
import 'package:praemiclient/screens/ScanQRScreen/widgets/ScannerCodeQr.dart';

class ScanQRScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ScannerQrBloc(),
      child: Scaffold(
        appBar: AppBar( 
          title: Text('Escanea tu codigo'),
          actions: [
            BlocBuilder<ScannerQrBloc, ScannerQrState>(
            builder: (context, state) {
              if(state is SQrLoading){
                return Container(
                  width: 41,
                  padding: EdgeInsets.only(right: 15, top: 15, bottom: 15),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00f594)),
                    strokeWidth: 2,
                  ),
                );
              }
              return const SizedBox();
            })
          ],
          ),
        body: ScannerCodeQr(),
      )
    );
  }
}