

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest/rest/receipesApi.dart';

import 'model/Recipe.dart';

class RecipesList extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
      ),
      body: Container(
        child: RecipesListView(),
      ),
    );
  }
}

class RecipesListView extends StatefulWidget {

  @override
  _List createState() => _List();
}

class _List extends State<RecipesListView> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    loadRecipes();
    super.initState();
  }

  loadRecipes() async{
    List<Recipe> response = await RecipesAPI().findReceipes();

    setState(() {
      recipes = response;
    });
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: recipes.length,
        itemBuilder: (context, i) =>
            Dismissible(
                key: Key(i.toString()),
                child: ListTile(
                  title: Column(
                    children: [
                      Text(recipes[i].title),
                      Image.network(recipes[i].image)
                    ],
                  )
                  
                )
            )
    );
  }
}