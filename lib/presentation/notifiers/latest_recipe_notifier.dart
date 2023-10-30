import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:cuban_recipes/domain/use_cases/get_latest_recipe_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class LatestRecipesNotifier extends ChangeNotifier {
  final GetLatestRecipeUseCase _recipesHive;

  dynamic _recipes =[];

  LatestRecipesNotifier(this._recipesHive);

  dynamic get latestRecipesData => _recipes;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getRecipes() async {
    setLoader(true);

    final result = await _recipesHive.execute(unit);
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
