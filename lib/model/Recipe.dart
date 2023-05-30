

import 'dart:convert';

class Recipe{
  int id;
  String title;
  String image;

  Recipe({required this.id, required this.title, required this.image});

  factory Recipe.fromJson(Map<String, dynamic> json){
    return Recipe(id: json["id"], title: json["title"], image: json["image"]);
  }
}