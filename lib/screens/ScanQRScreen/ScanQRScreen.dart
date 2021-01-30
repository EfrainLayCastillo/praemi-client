import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MaterialApp(home: ScanQRScreen()));

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({ Key key, }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isPauseCamera = false;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Escanea tu codigo'),
      ),
      body: Stack(
        children: <Widget>[
          Container( 
            width: _size.width,
            height: _size.height,
            child: _buildQrView(context)
          ),
          Positioned(
            bottom: 30,
            width: _size.width,
            child: Center(child: _controlScanner(_size))
          ),
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.center,
              width: _size.width,
              height: 50,
              color: Colors.blueGrey.withOpacity(0.5),
              child: (result != null) ?
                Text( 'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}') :
                Text('Scan a code'),
            )
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    Size _size = MediaQuery.of(context).size;
    var scanArea = _size.width * 0.6;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blue[800],
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 5,
        cutOutSize: scanArea,
      ),
    );
  }

  Widget _controlScanner(Size size){
    return Container(
      width: size.width * 0.9,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            onPressed: ()=> setState( () { controller?.toggleFlash(); }),
            icon: FutureBuilder(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                return Icon( snapshot.data == true ? 
                  Icons.flash_on : Icons.flash_off, color: Colors.white, size: 30 
                );
              },
            ) 
          ),
          IconButton(
            onPressed: ()  => {
                if(isPauseCamera){
                  setState(() { 
                    isPauseCamera = false;
                    controller?.resumeCamera();
                  })
                }else {
                  setState(() { 
                    isPauseCamera = true;
                    controller?.pauseCamera();
                  })
                }
            },
            icon: Icon( 
                  isPauseCamera ? 
                  Icons.play_circle_fill :
                  Icons.pause_circle_filled,
                  color: Colors.white, size: 30, 
            ) 
          ),
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            onPressed: ()=> setState( () { controller?.flipCamera(); }),
            icon: Icon(Icons.flip_camera_android_rounded, color: Colors.white, size: 30), 
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if(scanData != null) { Vibration.vibrate(duration: 1000); }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
