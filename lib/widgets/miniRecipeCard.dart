//import 'dart:html';
import 'package:flutter/material.dart';

class MiniRecipeCard extends StatefulWidget {
  @override
  _MiniRecipeCardState createState() => _MiniRecipeCardState();
}

class _MiniRecipeCardState extends State<MiniRecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        child: ListTile(
            onTap: () {},
            //TODO opens up the recipe card for that list tile,
            title: Text("This is a recipe!"),
            leading: Image(
              image: NetworkImage(
                  'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/154660.jpg'),
            )));
  }
}
