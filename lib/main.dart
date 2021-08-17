import 'package:flutter/material.dart';
import 'package:horoscopo/pages/Home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Horoscopo",
      initialRoute: 'homepage',
      routes: {
        'homepage': (BuildContext context) => HomePage(),
      },
    );
  }
}
