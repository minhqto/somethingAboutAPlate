import "package:flutter/material.dart";
import 'package:mypalate/globals.dart' as globals;
import 'package:mypalate/widgets/customAppBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(globals.appBarHeight),
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
