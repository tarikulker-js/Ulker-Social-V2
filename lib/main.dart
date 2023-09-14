import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ulkersocialv2/screens/LoginScreen.dart';

void main() {   
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialColor customColor = MaterialColor(
      0xFF000000,
      const {
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(0xFF000000),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ulker Social V2',
      theme: ThemeData( 
        primarySwatch: customColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: customColor
      ),
      home: LoginScreen()
    );
  }
}
