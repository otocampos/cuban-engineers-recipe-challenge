import 'package:cuban_recipes/data/repository/recipes_data.dart';
import 'package:cuban_recipes/domain/repository/repository.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/networking/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class RecipeByIdNotifier extends ChangeNotifier {
  final GetRecipeByIdUseCase _recipesService;

  RecipeItem _recipeItem = RecipeItem(extendedIngredients: []);

  RecipeByIdNotifier(this._recipesService);

  RecipeItem get recipesData => _recipeItem;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getRecipeById(int id) async {
    setLoader(true);
    print(id);
    final result = await _recipesService.execute(id);
    result.fold(
      (failure) {
        setLoader(false);
      },
      (data) {
        _recipeItem = data;
        setLoader(false);
        notifyListeners();
      },
    );
  }
}
