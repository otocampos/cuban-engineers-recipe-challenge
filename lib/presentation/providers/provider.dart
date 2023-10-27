import 'package:cuban_recipes/domain/repository/recipes_by_id_repository.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:cuban_recipes/presentation/notifiers/recipe_by_id_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/repository.dart';
import '../../domain/use_cases/get_recipes_use_case.dart';
import '../notifiers/recipes_notifier.dart';

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});

final instance = GetIt.instance;
final repoRecipe = instance<Repository>();
final repoRecipeById = instance<RecipeByIdRepository>();
final recipesNotifierProvider =
    ChangeNotifierProvider((ref) => RecipesNotifier(GetRecipesUseCase(repoRecipe)));

final recipeByIdNotifierProvider = ChangeNotifierProvider(
    (ref) => RecipeByIdNotifier(GetRecipeByIdUseCase(repoRecipeById)));
