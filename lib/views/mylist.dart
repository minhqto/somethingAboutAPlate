import "package:flutter/material.dart";
import "dart:convert";
import "package:mypalate/widgets/miniRecipeCard.dart";
import 'package:mypalate/widgets/customAppBar.dart';
import 'package:mypalate/globals.dart' as globals;
import 'package:mypalate/data/recipe.dart' as recipe;

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    recipe.loadRecipes();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(globals.appBarHeight),
            child: CustomAppBar(appName: "My List")),
        body: ListView.builder(itemBuilder: (content, index) {
          return GestureDetector(
            onTap: (){},
            child: Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Column(
              children: <MiniRecipeCard>[
                MiniRecipeCard()


                //)
              ],
            ),
          ));
        }));
  }
}
