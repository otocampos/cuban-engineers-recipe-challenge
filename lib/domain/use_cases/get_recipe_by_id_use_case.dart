import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:dartz/dartz.dart';

import '../../common/use_case/base_use_case.dart';
import '../../networking/failure.dart';
import '../repository/recipes_by_id_repository.dart';
import '../repository/repository.dart';

class GetRecipeByIdUseCase extends BaseUseCase<int, RecipeItem> {
  final RecipeByIdRepository _repository;

  GetRecipeByIdUseCase(this._repository);

  @override
  Future<Either<Failure, RecipeItem>> execute(id) async {
    return await _repository.getRecipeById(id);
  }
}