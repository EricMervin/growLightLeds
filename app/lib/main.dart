import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

void main() {
  runApp(new GrowLedApp());
}
class GrowLedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grow Light LED',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        '/landingpage' : (BuildContext context) => new GrowLedApp(),
        '/loginpage' : (BuildContext context) => new LoginPage(),
        '/registerpage' : (BuildContext context) => new RegisterPage(),
        '/homepage' : (BuildContext context) => new HomePage(),
      },
    );
  }
}
