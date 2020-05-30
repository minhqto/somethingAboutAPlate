import 'package:flutter/material.dart';
import 'package:mypalate/home.dart';
import 'package:mypalate/views/mylist.dart';
import 'dart:ui' as ui;

double screenWidth;
double screenHeight;

void main() {
  screenWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
  screenHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/mylist': (context) => MyList(),
        //'/discover': (context) => Discover(),
        //'/meals': (context) => Meals(),
        //'/account': (context) => Account()
      },
    );
  }
}
