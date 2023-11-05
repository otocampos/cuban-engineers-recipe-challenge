import 'package:cuban_recipes/data/adapters/analyzed_instructions_dio_hive_adapter.dart';
import 'package:cuban_recipes/data/adapters/recipes_dio_hive_adapter.dart';
import 'package:cuban_recipes/data/adapters/steps_dio_hive_adapter.dart';
import 'package:cuban_recipes/database/models/analyzed_instructions_table.dart';
import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:cuban_recipes/database/models/step_table.dart';
import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/models/analyzed_instructions.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/models/step.dart';

import 'package:flutter_test/flutter_test.dart';

List<RecipeItem> mockRecipes = [];

void main() {
  test(' Recipes Constructor', () {
    final recipeItem1 = RecipeItem(title: 'Title 1');
    final recipeItem2 = RecipeItem(title: 'Title 2');

    final recipes = Recipes(recipes: [recipeItem1, recipeItem2]);

    expect(recipes.recipes.length, 2);
    expect(recipes.recipes[0].title, 'Title 1');
    expect(recipes.recipes[1].title, 'Title 2');
  });
  test('method toJson of Recipes', () {
    final recipeItem1 = RecipeItem(title: 'Title 1');
    final recipeItem2 = RecipeItem(title: 'Title 2');

    final recipes = Recipes(recipes: [recipeItem1, recipeItem2]);

    final json = recipes.toJson();

    expect(json['recipes'].length, 2);
    expect(json['recipes'][0]['title'], 'Title 1');
    expect(json['recipes'][1]['title'], 'Title 2');
  });
    test('recipe item  complete object for  inspiration view', () {
      final recipe = RecipeItem(
          id: 1,
          title: "titulo de teste",
          image: "url",
          readyInMinutes: 40,
          sourceName: "jhon",
          servings: 2);

      expect(recipe.id, 1);
      expect(recipe.title, isNotNull);
      expect(recipe.readyInMinutes, isNotNull);
      expect(recipe.servings, isNotNull);
      expect(recipe.image, isNotNull);
    });
    test('recipe item  object missing img for  inspiration view', () {
      final recipe = RecipeItem(
          id: 1,
          title: "titulo de teste",
          image: "",
          readyInMinutes: 40,
          sourceName: "",
          servings: 2);

      expect(recipe.id, 1);
      expect(recipe.title, isNotNull);
      expect(recipe.readyInMinutes, isNotNull);
      expect(recipe.servings, isNotNull);
      expect(recipe.image, isEmpty);
      expect(recipe.sourceName, isEmpty);
    });
    test('Method fromJson of RecipeItem', () {
      final json = mockRecipesJson;

      final recipe = RecipeItem.fromJson(recipeItemJson);

      expect(recipe.title, 'title test');
    //  expect(recipe.recipes.first 'Instruções de exemplo');
      // Faça as verificações para outros atributos
    });
    test('Method toJson of RecipeItem', () {
      final recipe = RecipeItem(
        title: 'Título de Exemplo',
      );

      final json = recipe.toJson();

      expect(json['title'], 'Título de Exemplo');
      // Faça as verificações para outros atributos
    });
    test('Method == of RecipeItem', () {
      final recipe1 = RecipeItem(title: 'Title A');
      final recipe2 = RecipeItem(title: 'Title A');
      final recipe3 = RecipeItem(title: 'Title B');

      expect(recipe1 == recipe2, isTrue);
      expect(recipe1 == recipe3, isFalse);
    });
    test('recipe item table of hive  object complete for  latest view', () {
      final recipe = RecipeTable(
          id: 1,
          title: "titulo de teste",
          image: "url",
          readyInMinutes: 40,
          sourceName: "nome teste",
          servings: 2);

      expect(recipe.id, 1);
      expect(recipe.title, isNotNull);
      expect(recipe.readyInMinutes, isNotNull);
      expect(recipe.servings, isNotNull);
      expect(recipe.image, isNotNull);
      expect(recipe.sourceName, isNotNull);
    });
    test('Testing Adapter of recipeItem model to RecipeTable for save in Hive', () {
      final recipe = RecipeItem(
          id: 1,
          title: "titulo de teste",
          image: "url",
          readyInMinutes: 40,
          sourceName: "nome teste",
          servings: 2);
var recipeTable = RecipeDioHiveAdapter.convert(recipe);
      expect(recipeTable, isA<RecipeTable>());

    });

    test('Correct Build StepRecipe class', () {
      StepRecipe step = StepRecipe(number: 1, step: 'desc of recipe estep');
      expect(step.number, 1);
      expect(step.step, 'desc of recipe estep');
    });
    test('Wrong Build StepRecipe class', () {
      StepRecipe step = StepRecipe();
      expect(step.number, isNull);
      expect(step.step, isNull);
    });

    test('Correct Build StepTable class', () {
      StepTable step = StepTable(number: 1, step: 'desc of recipe estep');
      expect(step.number, 1);
      expect(step.step, 'desc of recipe estep');
    });
    test('Wrong Build StepTable class', () {
      StepTable step = StepTable();
      expect(step.number, isNull);
      expect(step.step, isNull);
    });
    test('Testing Adapter of stepItem model to stepTable for save in Hive', () {
      final step = StepRecipe(number: 1,step: "test");
      var stepTable = StepRecipeDioHiveAdapter.convert(step);
      expect(stepTable, isA<StepTable>());

    });
    test('Method fromJson of Recipe step', () {

      final step = StepRecipe.fromJson(stepJson);

      expect(step.number, 1);
      //  expect(recipe.recipes.first 'Instruções de exemplo');
      // Faça as verificações para outros atributos
    });
    test('Method toJson of StepRecipe', () {
      final step = StepRecipe(
        number: 3,
        step: 'step 3',
      );

      final json = step.toJson();

      expect(json['number'], 3);
      expect(json['step'], 'step 3');
    });
    test('Method toString of StepRecipe', () {
      final step = StepRecipe(
        number: 4,
        step: 'step 4',
      );

      final expectedString = 'Step(number: 4, step: step 4)';

      expect(step.toString(), expectedString);
    });

    test('Analyzed Structions without steps', () {
      List<StepRecipe> steps =[ StepRecipe()];
     AnalyzedInstructions analyzed = AnalyzedInstructions(steps: steps);
      expect(analyzed.steps?[0].step, isNull);
      expect(analyzed.steps?[0].number, isNull);
    });
    test('Testing Adapter of AnlyzedInstructions Adapter  model to AnalyzedInstructionsTable for save in Hive', () {
      List<StepRecipe> steps =[ StepRecipe()];
      AnalyzedInstructions analyzed = AnalyzedInstructions(steps: steps);

      var analyzeTable = AnalyzedInstructionsDioHiveAdapter.convert(analyzed);
      expect(analyzeTable, isA<AnalyzedInstructionsTable>());

    });

}
