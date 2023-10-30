import 'package:cuban_recipes/common/widgets/toast_message.dart';
import 'package:cuban_recipes/common/widgets/toast_message_impl.dart';
import 'package:cuban_recipes/data/repository/latest_recipe_impl.dart';
import 'package:cuban_recipes/data/repository/recipes_by_id_impl.dart';
import 'package:cuban_recipes/database/models/analyzed_instructions_table.dart';
import 'package:cuban_recipes/database/models/step_table.dart';
import 'package:cuban_recipes/domain/repository/latest_recipes_repository.dart';
import 'package:cuban_recipes/domain/use_cases/get_latest_recipe_use_case.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/models/analyzed_instructions.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/step.dart';
import 'package:cuban_recipes/networking/api_service.dart';
import 'package:cuban_recipes/networking/dio_client.dart';
import 'package:cuban_recipes/data/repository/recipes_impl.dart';
import 'package:get_it/get_it.dart';


import '../database/models/recipe_table.dart';
import '../domain/repository/recipes_by_id_repository.dart';
import '../domain/repository/recipes_repository.dart';

final instance = GetIt.instance;
Future<GetIt> initAppModule() async {

  instance.registerLazySingleton<CustomToastMessage>(() => CustomToastMessageImpl());

  instance.registerLazySingleton<DioClient>(() => DioClient(instance()));
  final dio = await instance<DioClient>().dio;
  instance.registerLazySingleton(() => ApiService(dio));


    instance.registerFactory<RecipesRepository>(() => RecipesRepositoryImpl(instance()));


  instance.registerFactory<RecipeByIdRepository>(() => RecipeByIdRepositoryImpl(instance()));
  instance.registerFactory<LatestRecipesRepository>(() => LatestRecipeImpl());

  instance.registerFactory<GetRecipesUseCase>(() => GetRecipesUseCase(instance()));
  instance.registerFactory<GetRecipeByIdUseCase>(() => GetRecipeByIdUseCase(instance()));
  instance.registerFactory<GetLatestRecipeUseCase>(() => GetLatestRecipeUseCase(instance()));




  instance.registerFactory(() => RecipeItem());
  instance.registerFactory(() => RecipeTable());
  instance.registerFactory(() => AnalyzedInstructionsTable());
  instance.registerFactory(() => AnalyzedInstructions());
  instance.registerFactory(() => StepTable());
  instance.registerFactory(() => StepRecipe());

return instance;
}

