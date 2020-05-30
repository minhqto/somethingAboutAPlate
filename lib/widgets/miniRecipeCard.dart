//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mypalate/data/recipe.dart';

class MiniRecipeCard extends StatefulWidget {
  final Recipe recipe;

  const MiniRecipeCard({Key key, this.recipe}) : super(key: key);

  @override
  _MiniRecipeCardState createState() => _MiniRecipeCardState();
}

class _MiniRecipeCardState extends State<MiniRecipeCard> {
  //still need to fix the width of the cards
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.25;
    double width = double.infinity;
    Recipe recipe = widget.recipe;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Picture of recipe
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  width: constraints.maxWidth * 0.3,
                  height: constraints.maxHeight * 0.9,
                  image: NetworkImage(recipe.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.03,
              ),
              // Information of Recipe
              Container(
                width: constraints.maxWidth * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      // Star and bookmark
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: '4.5'),
                                WidgetSpan(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Icon(
                                      Icons.star,
                                      size: 18.0,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.bookmark,
                            size: 18.0,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Recipe Name
                          Text(
                            recipe.recipeName,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          // Break Line
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 10.0),
                            child: Container(
                              height: 1.0,
                              width: constraints.maxWidth * 0.65,
                              color: Colors.grey,
                            ),
                          ),
                          // Time and Warning
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Icon(
                                      Icons.timer,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                    text: '30 mins',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Icon(
                                      Icons.warning,
                                      size: 18.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                    text: '3 warnings',
                                    style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
