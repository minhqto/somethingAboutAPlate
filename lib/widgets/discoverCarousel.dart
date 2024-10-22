import "package:flutter/material.dart";
import 'package:mypalate/globals.dart' as globals;
import 'package:mypalate/data/recipe.dart';
import "package:http/http.dart" as http;
import "dart:convert";

import 'package:mypalate/widgets/discoverMiniRecipeCard.dart';
import 'package:mypalate/widgets/miniRecipeCard.dart';

class DiscoverCarousel extends StatefulWidget {
  @override
  _DiscoverCarouselState createState() => _DiscoverCarouselState();
}

class _DiscoverCarouselState extends State<DiscoverCarousel> {
  final PageController ctrl = PageController(viewportFraction: 0.8);

  Stream<Recipe> slides;
  List<Recipe> myRecipes;
  int recipesLength = 0;
  int currentPage = 0;

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

    ctrl.addListener(() {
      int next = ctrl.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: ctrl,
      itemCount: recipesLength,
      itemBuilder: (context, index) {
        bool active = index == currentPage;
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[_buildRecipeImage(myRecipes[index], active)],
          ),
        );
      },
    );
  }

  _buildRecipeImage(Recipe recipe, bool active) {
    final double top = active ? 0 : 50;
    final double bottom = active ? 20 : 80;
    final double opacityAmt = active ? 1 : 0.4;

    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.height * 0.45,
          child: Opacity(
              opacity: opacityAmt,
              child: AnimatedContainer(
                child: Column(
                  children: <Widget>[],
                ),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuint,
                margin: EdgeInsets.only(
                    top: top, right: 0, left: 0, bottom: bottom),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      recipe.imageUrl,
                    ),
                  ),
                ),
              )),
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: active
              ? MiniRecipeCard(
                  recipe: recipe,
                )
              : SizedBox.shrink(),
        )
      ],
    );
  }
}
