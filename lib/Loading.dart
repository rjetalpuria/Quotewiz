import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Quote.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app_quote/Home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupQuote() async{
    Quote instance  = new Quote();
    await instance.getQuote();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'quote': instance.q,
      'author': instance.a,
    });
  }

  @override
  void initState() {
    super.initState();
    setupQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(
          color: color1,
          size: 50.0,
        )
      ),
    );
  }
}
