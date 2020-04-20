import 'package:flutter/material.dart';
import 'LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medical Appointment",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: Colors.red,
        accentColor: Colors.green,
      ),
      home:Sign_in(),
    );
  }
}

