import 'package:cuban_recipes/data/repository/recipes_impl.dart';
import 'package:cuban_recipes/domain/repository/recipes_repository.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/networking/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';


class RecipesNotifier extends ChangeNotifier {
  final GetRecipesUseCase _recipesService;

  Recipes _recipes = Recipes(recipes: []);

  RecipesNotifier(this._recipesService);

  Recipes get recipesData => _recipes;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getRecipes() async {
    setLoader(true);

    final result = await _recipesService.execute(unit);
    result.fold(
      (failure) {
        setLoader(false);
      },
      (data) {
        _recipes = data;
        setLoader(false);
        notifyListeners();
      },
    );
  }
}


