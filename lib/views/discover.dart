import "package:flutter/material.dart";
import 'package:mypalate/widgets/customAppBar.dart';
import 'package:mypalate/globals.dart' as globals;
import 'package:mypalate/widgets/discoverCarousel.dart';
import 'package:mypalate/data/recipe.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {



  final PageController ctrl = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(globals.appBarHeight),
            child: CustomAppBar(appName: "Discover")),
        body:
            Column(
              children: <Widget>[
                Expanded(
                  child: DiscoverCarousel(),
                ),
                SizedBox(
                  height: 300,
                ),
                Text("hello")
              ],
            )
    );
  }
}
