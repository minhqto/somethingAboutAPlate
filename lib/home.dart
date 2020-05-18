import "package:flutter/material.dart";

//import "./widgets/bottomMenuBar.dart";
import "package:mypalate/views/mylist.dart";
import 'package:mypalate/views/homePage.dart';
import 'package:mypalate/views/discover.dart';
import 'package:mypalate/widgets/customAppBar.dart';
import 'package:mypalate/globals.dart' as globals;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double menuBarHeight = MediaQuery.of(context).size.height * 0.8;
    double menuBarWidth = MediaQuery.of(context).size.width * 0.1;

    return Scaffold(
        appBar: null,
        body: Stack(
          children: <Widget>[
            Container(
                child: new IndexedStack(
                    index: _selectedIndex,
                    children:
                    <Widget>[
                      HomePage(),
                      MyList(),
                      Discover(),

                    ])),
            Positioned.fill(
              child: LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: menuBarHeight * 1,
                      bottom: menuBarHeight * .14,
                      left: menuBarWidth * .4,
                      right: menuBarWidth * .4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    child: BottomNavigationBar(
                      onTap: _onItemTapped,
                      currentIndex: _selectedIndex,
                      selectedItemColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.amber,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          title: Text("Home",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black, fontFamily: "Nunito-Regular")),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.format_list_numbered),
                          title: Text("My List",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black, fontFamily: "Nunito-Regular")),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.remove_red_eye),
                          title: Text("Discover",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black, fontFamily: "Nunito-Regular")),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.fastfood),
                          title: Text("Meals",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black, fontFamily: "Nunito-Regular")),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle),
                          title: Text("Account",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black, fontFamily: "Nunito-Regular")),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ));
  }
}
