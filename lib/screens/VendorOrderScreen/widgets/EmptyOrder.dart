import 'package:flutter/material.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width,
        height: _size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.luminosity),
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/BrandBook.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Center(
              child: Column(
                children: [
                  Text(
                    '¡Aun no tienes ordenes!',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Recuerda escanear el codigo QR promocial correpondiente, para generar una orden.',
                      style: TextStyle(
                          height: 1.5, color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
