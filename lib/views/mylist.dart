import "package:flutter/material.dart";
import "dart:convert";
import "package:mypalate/widgets/miniRecipeCard.dart";
import 'package:mypalate/widgets/customAppBar.dart';
import 'package:mypalate/globals.dart' as globals;

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(globals.appBarHeight),
            child: CustomAppBar(appName: "My List")),
        body: ListView.builder(itemBuilder: (content, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Column(
              children: <MiniRecipeCard>[
                MiniRecipeCard()
                //onTap: (){print("Tapped!");},
                //)
              ],
            ),
          );
        }));
  }
}
