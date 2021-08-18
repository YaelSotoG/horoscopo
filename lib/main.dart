import 'package:flutter/material.dart';
import 'package:horoscopo/pages/Home_page.dart';
import 'package:horoscopo/pages/prueba_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Horoscopo",
      initialRoute: 'prueba',
      routes: {
        'homepage': (BuildContext context) => HomePage(),
        'prueba': (BuildContext context) => PruebaPage()
      },
    );
  }
}
