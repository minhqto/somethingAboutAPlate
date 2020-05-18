import 'package:flutter/material.dart';

class BottomMenuBar extends StatefulWidget {
  @override
  _BottomMenuBarState createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {

  int _selectedIndex = 0 ;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                title: Text("Home", style: TextStyle(fontSize: 100, color: Colors.black, fontFamily: "Nunito-Regular")),

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
    );
  }
}
