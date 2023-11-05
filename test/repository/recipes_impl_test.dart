import 'package:cuban_recipes/data/repository/recipes_impl.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipesRepository extends Mock implements RecipesRepositoryImpl {}

late MockRecipesRepository mockRecipesService;

void main() {
  setUp(() {
    mockRecipesService = MockRecipesRepository();
  });
  initAppModule();

  test('Get Recipes using the RecipesRepositoryImpl', () async {
    void arrageReciperServiceReturnsRecipes() {
      when(() => mockRecipesService.getRecipes())
          .thenAnswer((_) async => Right(mockedRecipes));
    }
    arrageReciperServiceReturnsRecipes();

    final result = await mockRecipesService.getRecipes();

    expect(result.isRight(), isTrue);
    verify(() => mockRecipesService.getRecipes()).called(1);

  });
}
