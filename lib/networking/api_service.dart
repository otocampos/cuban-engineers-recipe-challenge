import 'package:cuban_recipes/constants/url_endpoints.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' ;
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(UrlEndpoints.LIST_RANDOM_RECIPES)
  Future<Recipes> getRecipes();

  @GET('${UrlEndpoints.RECIPES_PARAM}/{recipeId}/information')
  Future<RecipeItem> getRecipeById(@Path('recipeId') int recipeId);




}