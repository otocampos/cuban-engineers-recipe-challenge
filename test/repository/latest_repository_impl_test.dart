import 'package:cuban_recipes/data/repository/latest_recipe_impl.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/repository/latest_recipes_repository.dart';
import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLatestRecipesRepositoryImpl extends Mock implements LatestRecipeImpl {}

late MockLatestRecipesRepositoryImpl mockLatestRecipesRepositoryImpl;

void main() {
  setUp(() {
    mockLatestRecipesRepositoryImpl = MockLatestRecipesRepositoryImpl();
  });
  //initAppModule();

  test('Get Recipes using the LatestRecipeImpl', () async {
    void arrageReciperServiceReturnsRecipes() {
      when(() => mockLatestRecipesRepositoryImpl.getLatestRecipes())
          .thenAnswer((_) async => Right(mockedRecipes));
    }
    arrageReciperServiceReturnsRecipes();

    final result = await mockLatestRecipesRepositoryImpl.getLatestRecipes();

    expect(result.isRight(), isTrue);
    verify(() => mockLatestRecipesRepositoryImpl.getLatestRecipes()).called(1);

  });
}
