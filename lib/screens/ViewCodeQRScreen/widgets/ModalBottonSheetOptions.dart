import 'package:flutter/material.dart';

void modalBottonSheetOptions(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.save_alt, color: Colors.blue[800]),
                  title: new Text('Guardar Codigo como Imagen'),
                  onTap: () => {}),
              new ListTile(
                leading:
                    new Icon(Icons.share_outlined, color: Colors.blue[800]),
                title: new Text('Compartir Codigo QR'),
                onTap: () => {},
              ),
              const SizedBox(height: 20)
            ],
          ),
        );
      });
}
