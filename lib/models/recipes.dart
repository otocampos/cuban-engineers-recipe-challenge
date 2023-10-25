import 'package:cuban_recipes/models/recipe_item.dart';

class Recipes {
  final List<RecipeItem> recipes;

  Recipes({required this.recipes});

  factory Recipes.fromJson(Map<String, dynamic> json) {
    final recipeItems = List<RecipeItem>.from(
        json['recipes'].map((item) => RecipeItem.fromJson(item)));
    return Recipes(recipes: recipeItems);
  }

  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes.map((recipe) => recipe.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Recipe(recipes: $recipes)';
  }
}