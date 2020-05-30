import "package:flutter/material.dart";
import 'package:mypalate/widgets/customAppBar.dart';
import 'package:mypalate/globals.dart' as globals;
import 'package:mypalate/widgets/discoverCarousel.dart';

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
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.1),
          child: CustomAppBar(appName: "Discover")),
      body: Container(
        child: DiscoverCarousel(),
      ),
    );
  }
}
