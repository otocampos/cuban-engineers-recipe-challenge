import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:dartz/dartz.dart';

import '../../networking/failure.dart';

abstract class RecipesRepository {
  Future<Either<Failure, Recipes>> getRecipes();
}

