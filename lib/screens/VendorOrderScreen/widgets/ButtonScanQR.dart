
import 'package:flutter/material.dart';
import 'package:praemiclient/screens/ScanQRScreen/ScanQRScreen.dart';

class ButtonScanQR extends StatelessWidget {
  
  const ButtonScanQR({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 53,
      child: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute( 
            fullscreenDialog: true,
            builder: (context) => ScanQRScreen()
          )
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Escanear codigo'.toUpperCase(), 
            style: TextStyle(color: Colors.white, letterSpacing: 0.9) 
          ),
        ),
        icon: Icon(
          Icons.qr_code_scanner_outlined, 
          size: 25, 
          color: Color(0xff00f594),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        heroTag: 'rrrr555',
      ),
    );
  }
}