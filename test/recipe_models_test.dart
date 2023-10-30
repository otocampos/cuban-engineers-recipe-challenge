import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:cuban_recipes/database/models/step_table.dart';
import 'package:cuban_recipes/models/analyzed_instructions.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/step.dart';

import 'package:flutter_test/flutter_test.dart';

List<RecipeItem> mockRecipes = [];

void main() {
    test('recipe item  complete object for  inspiration view', () {
      final recipe = RecipeItem(
          id: 1,
          title: "titulo de teste",
          image: "url",
          readyInMinutes: 40,
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
    test('Analyzed Structions without steps', () {
      List<StepRecipe> steps =[ StepRecipe()];
     AnalyzedInstructions analyzed = AnalyzedInstructions(steps: steps);
      expect(analyzed.steps?[0].step, isNull);
      expect(analyzed.steps?[0].number, isNull);
    });


}
