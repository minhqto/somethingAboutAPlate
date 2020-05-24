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
  List<Recipe> myRecipes;
  int recipesLength = 0;

  List<Recipe> parseRecipes(String rb) {
    final parsed = json.decode(rb).cast<Map<String, dynamic>>();
    return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
  }

  Future<List<Recipe>> fetchRecipes(http.Client client) async {
    final response = await client.get('http://159.203.29.234:8080/v1/recipes');
    return parseRecipes(response.body);
  }

  @override
  void initState() {
    super.initState();
    fetchRecipes(http.Client()).then((result) {
      setState(() {
        myRecipes = result;
        recipesLength = result
            .length; //need this otherwise an exception is thrown under "itemCount" for listView builder
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(globals.appBarHeight),
            child: CustomAppBar(appName: "My List")),
        body: ListView.builder(
            itemCount: recipesLength,
            itemBuilder: (context, index) {
              Recipe curRecipe = myRecipes[index];
              return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                    child: Column(
                      children: <Widget>[
                        MiniRecipeCard(recipe: curRecipe),
                      ],
                    ),
                  ));
            }));
  }
}
