import "package:flutter/material.dart";
import "dart:convert";
import "package:mypalate/widgets/miniRecipeCard.dart";
import 'package:mypalate/widgets/customAppBar.dart';
import 'package:mypalate/globals.dart' as globals;
import 'package:mypalate/data/recipe.dart';
import "package:http/http.dart" as http;

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {

  Recipe aRecipe;

  Future<void> loadRecipes() async
  {
    try {
      final http.Response rp = await http.get("http://159.203.29.234:8080/v1/recipes/1");
      if(rp.statusCode == 200){
       List<dynamic> data = jsonDecode(rp.body);
       print(data[0]['recipe_id']);
      }else{
        throw Exception("Failed to load recipe!");
      }
    }catch (error){
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
     //futureRecipe =  loadRecipes();
    loadRecipes();
    //print(futureRecipe);
  }

  @override
  Widget build(BuildContext context) {

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
