import 'package:flutter/material.dart';
import 'package:flutter_api_app_frontend/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color:Colors.white),
        ),
      ),
      home: HomePage(),
      );
  }
}