import "package:flutter/material.dart";
import 'package:mypalate/model/MenuItem.dart';
import "package:mypalate/views/mylist.dart";
import 'package:mypalate/views/homePage.dart';
import 'package:mypalate/views/discover.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double menuBarHeight = screenHeight * 0.1;
    double menuBarWidth = screenWidth * 0.85;

    List<MenuItem> menuItems = [
      new MenuItem(name: "Hello", icon: Icon(Icons.home)),
      new MenuItem(name: "My List", icon: Icon(Icons.format_list_numbered)),
      new MenuItem(name: "Discover", icon: Icon(Icons.remove_red_eye)),
      // new MenuItem(name: "Meals", icon: Icon(Icons.fastfood)),
      // new MenuItem(name: "Account", icon: Icon(Icons.account_circle)),
    ];

    List<BottomNavigationBarItem> generateMenuItems() {
      List<BottomNavigationBarItem> bottomNavigationBarItems = [];
      for (var menuItem in menuItems) {
        bottomNavigationBarItems.add(BottomNavigationBarItem(
          icon: menuItem.icon,
          title: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              menuItem.name,
              style:
                  TextStyle(color: Colors.black, fontFamily: "Nunito-Regular"),
            ),
          ),
        ));
      }
      return bottomNavigationBarItems;
    }

    return Scaffold(
      appBar: null,
      body: Stack(
        children: <Widget>[
          Container(
            child: new IndexedStack(
              index: _selectedIndex,
              children: <Widget>[
                HomePage(),
                MyList(),
                Discover(),
              ],
            ),
          ),
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  margin: EdgeInsets.only(
                    top: screenHeight - menuBarHeight,
                    bottom: 10,
                    left: (screenWidth - menuBarWidth) / 2,
                    right: (screenWidth - menuBarWidth) / 2,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: BottomNavigationBar(
                      onTap: _onItemTapped,
                      currentIndex: _selectedIndex,
                      selectedItemColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.amber,
                      items: generateMenuItems(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
