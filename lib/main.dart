import 'package:flutter/material.dart';
import 'package:housy/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff3454d1),
          accentColor: Color(0xff75dddd),
          scaffoldBackgroundColor: Color(0x99222222)),
      home: HomePage(),
    );
  }
}
