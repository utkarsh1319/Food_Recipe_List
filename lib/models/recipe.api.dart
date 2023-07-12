import 'dart:convert';
import 'package:flutter_api_app_frontend/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

static Future<List<Recipe>>getRecipe()async{
  var uri= Uri.https('yummly2.p.rapidapi.com', '/feeds/list', 
  { "limit": "24", "start": "0", "tag": "list.recipe.popular"});

  final response =await http.get(uri, headers: {
    "X-RapidAPI-Key": "9256f1388fmsh824efd53b7a0f58p1f203bjsn9bcb2a6d289f",
	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
  "useQueryString": "true"
  });

  Map data = jsonDecode(response.body);
  List _temp=[];
  for(var i in data['feed']){
    _temp.add(i['content']['details']);
  }
  return Recipe.recipeFromSnapshot(_temp);
}
}


