import "package:flutter/material.dart";
//import "./widgets/bottomMenuBar.dart";
import "package:mypalate/views/mylist.dart";
import 'package:mypalate/views/homePage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0 ;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: <Widget>[
          Container(child: new IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              new HomePage(),
              new MyList(),
            ]
          )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
              child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
              ),
              child: BottomNavigationBar(
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.amber,

                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home", style: TextStyle(fontSize: 10, color: Colors.black)),

                  ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_numbered),
                  title: Text("My List", style: TextStyle(fontSize: 10, color: Colors.black)),
                  ),

                  BottomNavigationBarItem(
                  icon: Icon(Icons.remove_red_eye),
                  title: Text("Discover", style: TextStyle(fontSize: 10, color: Colors.black)),

                  ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood),
                  title: Text("Meals", style: TextStyle(fontSize: 10, color: Colors.black)),
                  ),

                  BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text("Account", style: TextStyle(fontSize: 10, color: Colors.black)),
                  ),

                  ],
              ),
              ),
              )
                    )
        ],
      )
    );
  }
}
