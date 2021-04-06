import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

Color color1 = Colors.black, color2 = Colors.black;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data;

  final List<Color> gradientColors = [Color(0xffffd500), Color(0xffda00ff),
    Color(0xFF1BFFFF),Color(0xFF2E3192),
    Color(0xFFFBB03B),Color(0xFFD4145A),
    Color(0xFFED1E79),Color(0xFF662D8C),
    Color(0xFFFCEE21),Color(0xFF009245),
  ];
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    var rand = new Random();
    int i = rand.nextInt(10);
    if(i%2 == 0){
      color1 = gradientColors[i];
      color2 = gradientColors[i+1];
    } else{
      color1 = gradientColors[i-1];
      color2 = gradientColors[i];
    }
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Center(
                  child: Stack(
                    children: [
                      Text('Quotewiz',
                      style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 50,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: <Color>[color2, color1],
                          ).createShader(Rect.fromCenter(center: Offset(200,100), width: 200, height: 0)),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                      Text('Quotewiz',
                        style: TextStyle(
                          fontFamily: 'SFPro',
                          fontSize: 50,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..shader = LinearGradient(
                              colors: <Color>[color1, color2],
                            ).createShader(Rect.fromCenter(center: Offset(200,100), width: 200, height: 0)),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          //radius: 2,
                          colors: [color1, color2],
                        ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        offset: Offset(0,10),
                        blurRadius: 50,
                      )]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(data['quote'],
                            style: TextStyle(
                              fontFamily: 'SFPro',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(data['author'],
                            style: TextStyle(
                              fontFamily: 'SFPro',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                            ),
                          ),
                        ],
                        ),
                    ),
                  ),
                ),
                // ADD THOUGHTS HERE

              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/');
        },
        child: Center(
          child: Icon(Icons.fiber_new,
                size: 40,
              ),
        ),
        foregroundColor: color1,
        backgroundColor: color2,
        elevation: 20,
      ),
    );
  }
}
