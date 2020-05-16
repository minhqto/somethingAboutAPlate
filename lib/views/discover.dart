import "package:flutter/material.dart";
import 'package:mypalate/widgets/customAppBar.dart';
import 'package:mypalate/globals.dart' as globals;

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(globals.appBarHeight),
            child: CustomAppBar(appName: "Discover")),
        body:
        Column(children: <Widget>[
          //need a carousel
          //and appBar
        ]));
  }
}
