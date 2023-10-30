import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:cuban_recipes/domain/repository/latest_recipes_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/use_case/base_use_case.dart';
import '../../networking/failure.dart';

class GetLatestRecipeUseCase extends BaseUseCase<Unit, dynamic> {
  final LatestRecipesRepository _repository;

  GetLatestRecipeUseCase(this._repository);

  @override
  Future<Either<Failure, dynamic>> execute(input) async {
    return await _repository.getLatestRecipes();
  }
}