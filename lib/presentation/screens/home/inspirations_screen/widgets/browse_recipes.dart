import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/browse_recipe_iten.dart';
import 'package:flutter/material.dart';

class BrowseRecipes extends StatelessWidget {
  final  List<RecipeItem> recipeList;
  const BrowseRecipes(this.recipeList);

  @override
  Widget build(BuildContext context) {
    return recipeList.isEmpty?Container(): BrowseRecipeItem(recipeItem:recipeList[1]);
  }
}




