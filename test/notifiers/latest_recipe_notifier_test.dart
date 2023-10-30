import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/domain/use_cases/get_latest_recipe_use_case.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/networking/failure.dart';
import 'package:cuban_recipes/presentation/notifiers/latest_recipe_notifier.dart';
import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// class MockRecipesService implements GetRecipesUseCase {
@override

class MockLatestRecipesService extends Mock implements GetLatestRecipeUseCase {}

void main() {
  late LatestRecipesNotifier sut_latestRecipesNotifier;
  late MockLatestRecipesService mockLatestRecipesService;

  setUp(() {
    mockLatestRecipesService = MockLatestRecipesService();
    sut_latestRecipesNotifier = LatestRecipesNotifier(mockLatestRecipesService);
  });
  test('Should check initial values are correct', () {
    expect(sut_latestRecipesNotifier.isLoading, false);
    expect(sut_latestRecipesNotifier.latestRecipesData, []);
  });
  group('getRecipes', () {
    void arrageReciperServiceReturnsRecipes() {
      when(() => mockLatestRecipesService.execute(unit))
          .thenAnswer((_) async => Right(mockedRecipes));
    }
    test('Get Recipes using the RecipesService', () async {
      arrageReciperServiceReturnsRecipes();
      await sut_latestRecipesNotifier.getRecipes();
      verify(() => mockLatestRecipesService.execute(unit)).called(1);
    });

    test('''Loading data indicator, 
      sets recipes, indicates data is not loaded anymore''', () async {
      arrageReciperServiceReturnsRecipes();
      final future = sut_latestRecipesNotifier.getRecipes();
      expect(sut_latestRecipesNotifier.isLoading, true);
      await future;
      expect(sut_latestRecipesNotifier.latestRecipesData, mockedRecipes);
      expect(sut_latestRecipesNotifier.isLoading, false);
    });

  });
}
