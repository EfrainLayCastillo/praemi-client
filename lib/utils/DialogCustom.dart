import 'package:flutter/material.dart';

class DialogCustom extends StatelessWidget {
  final String title, message, textBtn, pathImage;
  final VoidCallback _onPressed;

  DialogCustom(
      {Key key,
      this.title,
      this.message,
      this.textBtn,
      this.pathImage,
      VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogcontent(context),
    );
  }

  dialogcontent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 200,
            bottom: 40,
            left: 15,
            right: 15,
          ),
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 20.00,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25.00,
              ),
              Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: 16, color: Colors.black54, height: 1.2),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 40.00,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.00),
                    ),
                    child: Text(
                      textBtn,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    color: Color(0xFF1dca40),
                    padding: EdgeInsets.symmetric(
                        horizontal: 50.00, vertical: 15.00),
                    textColor: Colors.white,
                    onPressed: _onPressed,
                  )),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 60,
          right: 60,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            backgroundImage: AssetImage(pathImage),
            radius: 108,
          ),
        )
      ],
    );
  }
}
