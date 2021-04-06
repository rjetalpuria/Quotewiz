import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quote/Loading.dart';
import 'Home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
    darkTheme: ThemeData(
      backgroundColor: Colors.grey[800]
    ),
    theme: ThemeData(
      backgroundColor: Colors.white,
    ),
  ));
}

