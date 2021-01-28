import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praemiclient/models/data_code_qr_model.dart';
import 'package:praemiclient/screens/ViewCodeQRScreen/widgets/ModalBottonSheetOptions.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ViewCodeQRScreen extends StatelessWidget {
  final DataCodeQrModel dataCodeQrModel;
  const ViewCodeQRScreen({Key key, this.dataCodeQrModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size _sizeScreen = MediaQuery.of(context).size;
    Color _mainColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
         value: SystemUiOverlayStyle.dark,  
          child: Stack(
          children: [ 
            Container(
              padding: EdgeInsets.all(20),
              height: _sizeScreen.height,
              width: _sizeScreen.width,
              child: Center(
                child: QrImage(
                  data: dataCodeQrModel.toJsonStringFormat(),
                  version: QrVersions.auto,
                  size: _sizeScreen.width * 0.6,
                  gapless: false,
                  foregroundColor: _mainColor,
                  embeddedImage: AssetImage('assets/icon-praemi.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(50,50),
                  ),
                )
              ),
            ),
            Positioned(
              width: _sizeScreen.width,
              top: _sizeScreen.height * 0.15,
              child:  Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '¡Su codigo se ha generado!'.toUpperCase(), 
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              width: _sizeScreen.width,
              top: _sizeScreen.height * 0.65,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Recuerda presentar el codigo QR generado en el local correpondiente, para disfrutar de este descuento explusivo solo para ti.', 
                  style: TextStyle( height: 1.5, color: Colors.black87, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: _sizeScreen.height * 0.05,
              right: 20,
              child: IconButton(
                splashColor: Colors.blue,
                icon: Icon(
                  Icons.close,
                  color: _mainColor,
                  size: 35,
                ),
                onPressed: () => Navigator.pop(context),
              )
            )
          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _mainColor,
        child: Icon( Icons.menu ),
        onPressed: () => {
          modalBottonSheetOptions(context)
        },
      ),
    );
  }
}