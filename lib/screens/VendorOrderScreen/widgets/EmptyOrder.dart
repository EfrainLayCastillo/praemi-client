import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:praemiclient/utils/theme/PraemiTheme.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      color: Colors.white10,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: _image(path: 'assets/gift-praemi.svg', widthSvg: _size.width *0.4, )
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _image(path: 'assets/praemiLogo-1.svg',widthSvg: _size.width * 0.75),
                const SizedBox(height: 20),
                PraemiTheme.titleh1(text: '¡Aun no tienes ordenes!', size: 32),
                const SizedBox(height: 20),
                Text(
                  'Recuerda escanear el codigo QR promocial correpondiente, para generar una orden.',
                  style: TextStyle(height: 1.5, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _image({String path, double widthSvg}) {
    Widget emptySvg = SvgPicture.asset(
      path,
      width: widthSvg,
    );
    return emptySvg;
  }
}
