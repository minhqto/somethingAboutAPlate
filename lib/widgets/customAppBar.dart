import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String appName;

  CustomAppBar({this.appName});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {

    double titleLeftPadding = MediaQuery.of(context).size.width * 0.1;
    double titleTopPadding = MediaQuery.of(context).size.height * 0.08;

    return AppBar(
      flexibleSpace: Padding(
        child: Text(widget.appName,
            style: TextStyle(
                fontSize: 30,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito-Regular")),

        padding: EdgeInsets.only(left: titleLeftPadding, top: titleTopPadding)
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
