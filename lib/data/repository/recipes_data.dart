import 'package:cuban_recipes/domain/repository/repository.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/networking/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../networking/error_handling.dart';
import '../../networking/failure.dart';

class RecipesRepositoryImpl implements Repository {
  final ApiService _apiService;

  RecipesRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, Recipes>> getRecipes()async {
    try {
      final response =await  _apiService.getRecipes();
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, RecipeItem>> getRecipeById(id)async {
    try {
      final response =await  _apiService.getRecipeById(id);
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }


  }
}






