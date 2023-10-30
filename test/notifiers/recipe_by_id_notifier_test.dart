import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/networking/failure.dart';
import 'package:cuban_recipes/presentation/notifiers/recipe_by_id_notifier.dart';
import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

@override

class MockRecipeByIdService extends Mock implements GetRecipeByIdUseCase {}

void main() {
  late RecipeByIdNotifier sut_recipeByIdNotifier;
  late MockRecipeByIdService mockRecipeByIdService;

  setUp(() {
    mockRecipeByIdService = MockRecipeByIdService();
    sut_recipeByIdNotifier = RecipeByIdNotifier(mockRecipeByIdService);
  });
  test('Should check initial values are correct', () {
    expect(sut_recipeByIdNotifier.isLoading, false);
    expect(sut_recipeByIdNotifier.recipesData, RecipeItem());
  });
  group('getRecipeById', () {
    void arrageReciperServiceReturnsRecipes() {
      when(() => mockRecipeByIdService.execute(123))
          .thenAnswer((_) async => Right(mockedRecipes));
    }
    test('Get Recipe by id using the RecipeByIdService', () async {
      arrageReciperServiceReturnsRecipes();
      await sut_recipeByIdNotifier.getRecipeById(123);
      verify(() => mockRecipeByIdService.execute(123)).called(1);
    });

    test('Loading data indicator,sets recipes, indicates data is not loaded anymore', () async {
      arrageReciperServiceReturnsRecipes();
      final future = sut_recipeByIdNotifier.getRecipeById(123);
      expect(sut_recipeByIdNotifier.isLoading, true);
      await future;
      expect(sut_recipeByIdNotifier.recipesData, mockedRecipes);
      expect(sut_recipeByIdNotifier.isLoading, false);
    });

  });
}
