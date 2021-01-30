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
        appBar: AppBar( title: Text('Escanea tu codigo')),
        body: ScannerCodeQr(),
      )
    );
  }
}