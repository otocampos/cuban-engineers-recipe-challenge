import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/networking/failure.dart';
import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class MockRecipesService extends Mock implements GetRecipesUseCase {}

void main() {
  late RecipesNotifier sut_recipesNotifier;
  late MockRecipesService mockRecipesService;

  setUp(() {
    mockRecipesService = MockRecipesService();
    sut_recipesNotifier = RecipesNotifier(mockRecipesService);
  });
  test('Should check initial values are correct', () {
    expect(sut_recipesNotifier.isLoading, false);
    expect(sut_recipesNotifier.recipesData.recipes, []);
  });
  group('getRecipes', () {
    void arrageReciperServiceReturnsRecipes() {
      when(() => mockRecipesService.execute(unit))
          .thenAnswer((_) async => Right(mockedRecipes));
    }
    test('Get Recipes using the RecipesService', () async {
      arrageReciperServiceReturnsRecipes();
      await sut_recipesNotifier.getRecipes();
      verify(() => mockRecipesService.execute(unit)).called(1);
    });

    test('''Loading data indicator, 
      sets recipes, indicates data is not loaded anymore''', () async {
      arrageReciperServiceReturnsRecipes();
      final future = sut_recipesNotifier.getRecipes();
      expect(sut_recipesNotifier.isLoading, true);
      await future;
      expect(sut_recipesNotifier.recipesData, mockedRecipes);
      expect(sut_recipesNotifier.isLoading, false);
    });

  });
}
