import 'package:cuban_recipes/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:flutter/material.dart';

class RecipeByIdNotifier extends ChangeNotifier {
  final GetRecipeByIdUseCase _recipesService;

  dynamic _recipeItem = RecipeItem();

  RecipeByIdNotifier(this._recipesService);

  dynamic get recipesData => _recipeItem;

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
