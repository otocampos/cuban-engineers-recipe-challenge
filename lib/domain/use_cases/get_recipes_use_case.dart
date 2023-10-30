import 'package:cuban_recipes/models/recipes.dart';
import 'package:dartz/dartz.dart';

import '../../common/use_case/base_use_case.dart';
import '../../networking/failure.dart';
import '../repository/recipes_repository.dart';

class GetRecipesUseCase extends BaseUseCase<Unit, Recipes> {
  final RecipesRepository _repository;

  GetRecipesUseCase(this._repository);

  @override
  Future<Either<Failure, Recipes>> execute(input) async {
    return await _repository.getRecipes();
  }
}