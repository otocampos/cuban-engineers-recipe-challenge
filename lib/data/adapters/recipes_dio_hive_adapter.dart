import 'package:cuban_recipes/data/adapters/analyzed_instructions_dio_hive_adapter.dart';
import 'package:cuban_recipes/models/analyzed_instructions.dart';

import '../../database/models/recipe_table.dart';
import '../../models/recipe_item.dart';

class RecipeDioHiveAdapter {
  static RecipeTable convert(RecipeItem recipeItem) {
    return RecipeTable(
      creditsText: recipeItem.creditsText,
      license: recipeItem.license,
      sourceName: recipeItem.sourceName,
      pricePerServing: recipeItem.pricePerServing,
      id: recipeItem.id,
      title: recipeItem.title,
      readyInMinutes: recipeItem.readyInMinutes,
      servings: recipeItem.servings,
      sourceUrl: recipeItem.sourceUrl,
      image: recipeItem.image,
      imageType: recipeItem.imageType,
      summary: recipeItem.summary,
      instructions: recipeItem.instructions,
      originalId: recipeItem.originalId,
      analyzedInstructions: AnalyzedInstructionsDioHiveAdapter.convertList(recipeItem.analyzedInstructions),
      spoonacularSourceUrl: recipeItem.spoonacularSourceUrl,
    );
  }

  static List<RecipeTable> convertList(List<RecipeItem> recipeItems) {
    return recipeItems.map((item) => convert(item)).toList();
  }
}