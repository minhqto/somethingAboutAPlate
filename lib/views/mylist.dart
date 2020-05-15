import "package:flutter/material.dart";
import "dart:convert";
import "package:mypalate/widgets/miniRecipeCard.dart";



class MyList extends StatelessWidget {

  double appBarHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          flexibleSpace: Padding(
            child: Text("My List",
              style: TextStyle(fontSize: 28, color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
              padding: const EdgeInsets.fromLTRB(20,60,0,0),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      extendBodyBehindAppBar: true,

      body: ListView.builder(itemBuilder: (content, index){

        return Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(
            children: <MiniRecipeCard>[
              MiniRecipeCard()
              //onTap: (){print("Tapped!");},
              //)


            ],
          ),

        );
      })
    );
  }
}
