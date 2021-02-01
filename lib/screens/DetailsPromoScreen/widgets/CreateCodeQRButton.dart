import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:praemiclient/models/data_code_qr_model.dart';
import 'package:praemiclient/models/promos_model.dart';
import 'package:praemiclient/models/user.dart';
import 'package:praemiclient/screens/ViewCodeQRScreen/ViewCodeQRScreen.dart';
import 'package:praemiclient/utils/theme/PraemiTheme.dart';

class CreateCodeQRButton extends StatelessWidget {
  final PromosModel promosModel;
  final User userBtn;
  DataCodeQrModel dataCodeQrModel;

  CreateCodeQRButton({Key key, this.promosModel, this.userBtn})
   : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    _getDataCodeQrModel().then((value) => dataCodeQrModel = value);
    

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 53,
      child: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute( 
            fullscreenDialog: true,
            builder: (context) => ViewCodeQRScreen(dataCodeQrModel: dataCodeQrModel)
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
          color: PraemiTheme.colorSecondary
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        heroTag: 'rrrr2',
      ),
    );
  }

   Future<DataCodeQrModel> _getDataCodeQrModel() async{  
    
    return  DataCodeQrModel( 
      promoId: promosModel.id,
      userId: userBtn.idUser.toString(), 
      tokenAuth: userBtn.tokenAuth
    );
  }
}