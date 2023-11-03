import 'dart:convert';

import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:cuban_recipes/models/analyzed_instructions.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/models/step.dart';

import '../models/recipe_item.dart';

List<RecipeItem> mockRecipesForTesting = [
  RecipeItem(
      id: 1,
      sourceName: "jhon",
      image: "https://placehold.co/100x100",
      summary: "sumary test",
      readyInMinutes: 20,
      servings: 2,
      analyzedInstructions: [AnalyzedInstructions(steps:[StepRecipe(number: 1,step: "step 1 test")])],
      title: "title test"),

  RecipeItem(
      id: 2,
      sourceName: "Anne",
      image: "https://placehold.co/100x100",
      summary: "sumary test 2",
      readyInMinutes: 30,
      servings: 3,
      analyzedInstructions: [AnalyzedInstructions(steps:[StepRecipe(number: 1,step: "step 1")])],
      title: "title test 2"),
];

List<RecipeTable> mockRecipesForTestingTable = [
  RecipeTable(
      id: 1,
      sourceName: "jhon",
      image: "https://placehold.co/100x100",
      summary: "sumary test",
      readyInMinutes: 20,
      servings: 2,
      title: "title test"),

  RecipeTable(
      id: 2,
      sourceName: "Anne",
      image: "https://placehold.co/100x100",
      summary: "sumary test 2",
      readyInMinutes: 30,
      servings: 3,
      title: "title test 2"),
];




List<RecipeTable> mockRecipesForTestingHive = [
  RecipeTable(
      id: 1,
      sourceName: "jhon",
      image: "https://placehold.co/100x100",
      summary: "sumary test",
      readyInMinutes: 20,
      servings: 2,
      title: "title test"),
  RecipeTable(
      id: 2,
      sourceName: "Anne",
      image: "https://placehold.co/100x100",
      summary: "sumary test 2",
      readyInMinutes: 30,
      servings: 3,
      title: "title test 2"),
];
Recipes mockedRecipes = Recipes(recipes: mockRecipesForTesting);

final mockRecipesJson = jsonEncode(data);

final data = {
  "recipes": [
    {
      "id": 1,
      "sourceName": "jhon",
      "image": "https://placehold.co/100x100",
      "summary": "sumary test",
      "readyInMinutes": 20,
      "servings": 2,
      "title": "title test"
    }
  ],
};
