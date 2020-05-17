import 'dart:convert';

import "package:http/http.dart";


class Recipe{

  int recipeId;
  String recipeName;
  String recipeUrl;
  String imageUrl;
  int prepTime;
  int servings;
  String difficulty;
  String desc;
  String source;
  List<String> ingredients;
  List<String> tags;

  //constructor
  Recipe({
    this.recipeId,
    this.recipeName,
    this.recipeUrl,
    this.imageUrl,
    this.prepTime,
    this.servings,
    this.difficulty,
    this.desc,
    this.source,
    this.ingredients,
    this.tags});

}

Future<void>loadRecipes() async
{
  try {
    Response rp = await get("http://159.203.29.234:8080/v1/recipes/1");

    dynamic rpStr = jsonDecode(rp.body);
    print(rpStr.toString());

  }catch (error){
      print(error);
  }
}
