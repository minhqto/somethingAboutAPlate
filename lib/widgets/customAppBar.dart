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
    return AppBar(
      flexibleSpace: Padding(
        child: Text(widget.appName,
            style: TextStyle(
                fontSize: 30,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold)),
        padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
