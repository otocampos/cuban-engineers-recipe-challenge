import 'package:cuban_recipes/data/repository/recipes_by_id_impl.dart';
import 'package:cuban_recipes/data/repository/recipes_impl.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/repository/recipes_by_id_repository.dart';
import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipe extends Mock implements RecipeByIdRepositoryImpl {}

late MockRecipe mockRecipe;

void main() {
  setUp(() {
    mockRecipe = MockRecipe();
  });

  initAppModule();

  test('Get Recipes using the RecipesRepositoryByIdImpl', () async {
    void arrageReciperServiceReturnsRecipes() {
      when(() => mockRecipe.getRecipeById(0))
          .thenAnswer((_) async => Right(mockRecipesForTesting[0]));
    }
    arrageReciperServiceReturnsRecipes();

    final result = await mockRecipe.getRecipeById(0);

    expect(result.isRight(), isTrue);
    verify(() => mockRecipe.getRecipeById(0)).called(1);

  });
}
