import 'package:flutter/material.dart';
import 'package:flutter_api_app_frontend/models/recipe.api.dart';
import 'package:flutter_api_app_frontend/models/recipe.dart';
import 'package:flutter_api_app_frontend/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>_recipes;
  bool _isLoading =true;

  @override
  void initState() {
    
    super.initState();
    getRecipe();
  }

  Future<void>getRecipe()async{
    _recipes=await RecipeApi.getRecipe();
    setState(() {
      _isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Food Recipe List')
        ],
        ),
      ),
      body: _isLoading
            ?Center(child: CircularProgressIndicator())
            :ListView.builder(
              itemCount:_recipes.length,
              itemBuilder:(context,index){
                return RecipeCard(
                  title:_recipes[index].name,
                  cookTime:_recipes[index].totalTime,
                  rating:_recipes[index].rating.toString(),
                  thumbnailUrl:_recipes[index].images);
              },
      ));
  }
}