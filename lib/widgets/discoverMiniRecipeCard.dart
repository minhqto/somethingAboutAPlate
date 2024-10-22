import 'package:flutter/material.dart';
import 'package:mypalate/data/recipe.dart';

class DiscoverMiniRecipeCard extends StatefulWidget {
  final String recipeName;
  final int prepTime;
  final String desc;

  DiscoverMiniRecipeCard({this.recipeName, this.prepTime, this.desc});

  @override
  _DiscoverMiniRecipeCardState createState() => _DiscoverMiniRecipeCardState();

}

class _DiscoverMiniRecipeCardState extends State<DiscoverMiniRecipeCard> {

  //still need to fix the width of the cards

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 1),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.body1,
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
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.recipeName,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 10.0),
                          child: Container(
                            height: 1.0,
                            width: 200.0,
                            color: Colors.grey,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.body1,
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
                                  text: widget.prepTime.toString() + " mins",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.body1,
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
        ),
      ),
    );
  }
}
