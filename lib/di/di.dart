import 'package:cuban_recipes/common/widgets/toast_message.dart';
import 'package:cuban_recipes/common/widgets/toast_message_impl.dart';
import 'package:cuban_recipes/data/repository/recipes_by_id_impl.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/networking/api_service.dart';
import 'package:cuban_recipes/networking/dio_client.dart';
import 'package:cuban_recipes/networking/error_interceptor.dart';
import 'package:cuban_recipes/data/repository/recipes_data.dart';
import 'package:get_it/get_it.dart';

import '../common/app_context.dart';
import '../domain/repository/recipes_by_id_repository.dart';
import '../domain/repository/repository.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {

  instance.registerLazySingleton<CustomToastMessage>(() => CustomToastMessageImpl());
  instance.registerLazySingleton<DioClient>(() => DioClient(instance()));

  final dio = await instance<DioClient>().dio;

  instance.registerLazySingleton(() => ApiService(dio));
  instance.registerFactory<Repository>(() => RecipesRepositoryImpl(instance()));
  instance.registerFactory<RecipeByIdRepository>(() => RecipeByIdRepositoryImpl(instance()));
  instance.registerFactory<GetRecipesUseCase>(() => GetRecipesUseCase(instance()));
  instance.registerFactory<GetRecipeByIdUseCase>(() => GetRecipeByIdUseCase(instance()));
}