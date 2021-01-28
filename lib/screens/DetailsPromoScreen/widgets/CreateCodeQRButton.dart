import 'package:flutter/material.dart';
import 'package:praemiclient/models/data_code_qr_model.dart';
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/screens/ViewCodeQRScreen/ViewCodeQRScreen.dart';

class CreateCodeQRButton extends StatelessWidget {
  final PromosModel promosModel;
  const CreateCodeQRButton({Key key, this.promosModel})
   : super(key: key);

  @override
  Widget build(BuildContext context) {

    DataCodeQrModel _dataCodeQrModel = DataCodeQrModel( 
      promoId: promosModel.id, 
      vendorId: 'temp', 
      userId: 'test', 
      tokenAuth: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJp'
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 53,
      child: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute( 
            fullscreenDialog: true,
            builder: (context) => ViewCodeQRScreen(dataCodeQrModel: _dataCodeQrModel)
          )
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Generar codigo promocional'.toUpperCase(), 
            style: TextStyle(color: Colors.white, letterSpacing: 0.9) 
          ),
        ),
        icon: Icon(
          Icons.qr_code, 
          size: 20, 
          color: Colors.white
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        heroTag: 'rrrr2',
      ),
    );
  }
}