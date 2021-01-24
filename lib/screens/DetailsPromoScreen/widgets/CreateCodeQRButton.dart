import 'package:flutter/material.dart';
import 'package:praemiclient/screens/ViewCodeQRScreen/ViewCodeQRScreen.dart';

class CreateCodeQRButton extends StatelessWidget {
  const CreateCodeQRButton({Key key}) : super(key: key);

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
            builder: (context) => ViewCodeQRScreen()
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