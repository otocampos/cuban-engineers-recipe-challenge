import 'package:cuban_recipes/database/models/recipe_table.dart';

import 'package:cuban_recipes/networking/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../constants/hive_keys.dart';
import '../../domain/repository/latest_recipes_repository.dart';

class LatestRecipeImpl implements LatestRecipesRepository{
  @override
  Future<Either<Failure, dynamic>> getLatestRecipes()async {
    try {
      await Hive.openBox(HiveKeys.RECIPE_BOX_KEY);
      final box = Hive.box(HiveKeys.RECIPE_BOX_KEY);
     dynamic items = box.get(HiveKeys.LIST_RECIPES_KEY,defaultValue: []) ??[];
      return Right(items );
    } catch (e) {
      rethrow;
    }


  }

}