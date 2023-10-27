import 'package:dartz/dartz.dart';

import '../../models/recipe_item.dart';
import '../../networking/failure.dart';

abstract class RecipeByIdRepository{
  Future<Either<Failure, RecipeItem>> getRecipeById(id);




}