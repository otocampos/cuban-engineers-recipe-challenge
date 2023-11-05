import 'package:cuban_recipes/constants/hive_keys.dart';
import 'package:cuban_recipes/data/adapters/recipes_dio_hive_adapter.dart';
import 'package:cuban_recipes/database/models/analyzed_instructions_table.dart';
import 'package:cuban_recipes/database/models/step_table.dart';
import 'package:cuban_recipes/domain/repository/recipes_by_id_repository.dart';
import 'package:cuban_recipes/domain/repository/recipes_repository.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/networking/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../../database/models/recipe_table.dart';
import '../../networking/error_handling.dart';
import '../../networking/failure.dart';

class RecipeByIdRepositoryImpl implements RecipeByIdRepository {
  final ApiService _apiService;

  RecipeByIdRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, dynamic>> getRecipeById(id) async {
    try {
      await Hive.openBox(HiveKeys.RECIPE_BOX_KEY);
      final box = Hive.box(HiveKeys.RECIPE_BOX_KEY);
      dynamic items = box.get(HiveKeys.LIST_RECIPES_KEY) ?? [];
      dynamic item = items.singleWhere(
        (element) => element.id == id,
        orElse: () {
          return null;
        },
      );
      if (item == null) {
        print("RECIPE NOT FOUND IN HIVE... CONECTING WITH API");
        final response = await _apiService.getRecipeById(id);
        var recipe = RecipeDioHiveAdapter.convert(response);
        items.add(recipe);
        box.put(HiveKeys.LIST_RECIPES_KEY, items);
        return Right(response);
      }
      print("RECIPE FOUNDED IN HIVE");
      print(items.length);
      return Right(item);

      //RecipeItem item =  items.singleWhere((element) => element.id ==id);
    } on DioException catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
