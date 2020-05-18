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
    this.tags
  });

  factory Recipe.fromJson(Map<String, dynamic> json){
    return Recipe(
      recipeId: json['recipe_id'],
      recipeName: json['name'],
      recipeUrl: json['url'],
      imageUrl: json['img_url'],
      prepTime: json['prep_time'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      desc: json['description'],
      source: json['source'],
      ingredients: json['ingrediants'],
      tags: json['tags'],
    );
  }
}


