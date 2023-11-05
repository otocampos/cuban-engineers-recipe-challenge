import 'dart:io';

import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/data/repository/recipes_impl.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/di/hive_di.dart';
import 'package:cuban_recipes/domain/repository/recipes_repository.dart';
import 'package:cuban_recipes/domain/use_cases/get_latest_recipe_use_case.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:cuban_recipes/presentation/notifiers/recipe_by_id_notifier.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:cuban_recipes/presentation/screens/detail_recipe_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockRecipesService extends Mock implements GetRecipeByIdUseCase {}

void main() {
  setUpAll(()async {

    HttpOverrides.global = null;
  });

  final mockRecipesService = MockRecipesService();

  void getRecipesAfter2secondsDelay() {

    when(() => mockRecipesService.execute(1)).thenAnswer((_) async {
      return await Future.delayed(
          const Duration(seconds: 1), () => Right(mockRecipesForTesting[0]));
    });}
  Widget createWidgetUnderTest() {
    return ProviderScope(
        overrides: [
          recipeByIdNotifierProvider
              .overrideWith((ref) { return RecipeByIdNotifier(mockRecipesService);})
        ],
        child: const MaterialApp(
          home:  RecipeItemScreen( id: 1, title: 'recipe test',),
        ));
  }

    testWidgets('recipe by IdTest', (WidgetTester tester) async{

      getRecipesAfter2secondsDelay();
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();


      expect(find.text('recipe test'), findsOneWidget);
      expect(find.text('title test'), findsOneWidget);
      expect(find.text('Redy in: 20 minutes'), findsOneWidget);
      expect(find.text('Step 1'), findsOneWidget);
      expect(find.text('step 1 test'), findsOneWidget);

    });


}
