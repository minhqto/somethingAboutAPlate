import "package:flutter/material.dart";
import 'package:mypalate/globals.dart' as globals;
import 'package:mypalate/main.dart';
import 'package:mypalate/widgets/customAppBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.1),
          child: CustomAppBar(appName: "Home")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(image: AssetImage('assets/img/logo.png')))
        ],
      ),
    );
  }
}
