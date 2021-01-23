import 'package:flutter/material.dart';

class CreateCodeQRButton extends StatelessWidget {
  const CreateCodeQRButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 50,
      child: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => {},
        label: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Generar codigo promocional'.toUpperCase(), 
            style: TextStyle(color: Colors.white,) 
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