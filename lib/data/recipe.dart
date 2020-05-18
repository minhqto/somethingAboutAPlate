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
  List<dynamic> tags;

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
    this.tags
  });

   factory Recipe.fromJson(Map<String, dynamic> json){
    return new Recipe(
      recipeId: json['recipe_id'] as int,
      recipeName: json['name'] as String,
      recipeUrl: json['url'] as String,
      imageUrl: json['img_url']  as String,
      prepTime: json['prep_time'] as int,
      servings: json['servings'] as int,
      difficulty: json['difficulty'] as String,
      desc: json['description']  as String,
      source: json['source'] as String,
      ingredients: json['ingrediants'] as List<String>,
      tags: json['tags'] as List<dynamic>,
    );
  }


}



