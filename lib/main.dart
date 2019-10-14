import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/screens/price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.amberAccent,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
