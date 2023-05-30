
import 'dart:convert';
import 'dart:io';

import 'package:flutter_rest/model/Recipe.dart';
import 'package:http/http.dart' as http;

class RecipesAPI{

  Future<List<Recipe>> findReceipes() async{
    final queryParameters = {
      "number": "10",
      "apiKey": "0354b5e62cc34249800d0b5e41c5b29a"
    };

    final uri = Uri.https("api.spoonacular.com", "/recipes/random", queryParameters);
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    List<Recipe> recipes = [];



    print(jsonDecode(response.body)["recipes"]);
    for(var i=0; i<10; i++){
      recipes.add(Recipe.fromJson(jsonDecode(response.body)["recipes"][i] as Map<String, dynamic>));
    }

    return recipes;
  }

}