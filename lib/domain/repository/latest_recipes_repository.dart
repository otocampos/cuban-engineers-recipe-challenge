import 'package:dartz/dartz.dart';

import '../../database/models/recipe_table.dart';
import '../../networking/failure.dart';

abstract class LatestRecipesRepository {
  Future<Either<Failure,dynamic>> getLatestRecipes();
}
