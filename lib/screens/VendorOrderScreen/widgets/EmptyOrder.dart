import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          _image(widthSvg: _size.width),
          const SizedBox(height: 10),
          Text(
            '¡Aun no tienes ordenes!', 
            style: Theme.of(context).textTheme.headline5.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Recuerda escanear el codigo QR promocial correpondiente, para generar una orden.', 
            style: TextStyle( height: 1.5, color: Colors.black54, fontSize: 17),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
        ],
      )
    );
  }

  Widget _image({double widthSvg}){
    Widget emptySvg = SvgPicture.asset('assets/Empty-Order.svg', width: widthSvg + 30 );
    return emptySvg;
  }
  
}