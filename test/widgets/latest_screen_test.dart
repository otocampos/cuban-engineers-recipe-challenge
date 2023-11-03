import 'dart:io';

import 'package:cuban_recipes/di/hive_di.dart';
import 'package:cuban_recipes/domain/use_cases/get_latest_recipe_use_case.dart';
import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/presentation/notifiers/latest_recipe_notifier.dart';

import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/inspirations_screen.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/first_grid_item.dart';
import 'package:cuban_recipes/presentation/screens/home/latest_screen/latest_screen.dart';
import 'package:cuban_recipes/presentation/screens/home/latest_screen/widgets/latest_recite_item_widget.dart';
import 'package:cuban_recipes/utils/strings_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLatestRecipeUseCase extends Mock implements GetLatestRecipeUseCase {}

void main() {
  setUpAll(()async {

    HttpOverrides.global = null;
  });
  initAppModule();
  //initHiveModule();
  final mockUseCase = MockGetLatestRecipeUseCase();

  void getRecipesAfter2secondsDelay() {
    when(() => mockUseCase.execute(unit)).thenAnswer((_) async {
      return  Right(mockedRecipes);
    });
  }
  Widget createMainWidgetUnderTest() {
    return ProviderScope(
        overrides: [
          latestRecipesNotifierProvider
              .overrideWith((ref) => LatestRecipesNotifier(mockUseCase))
        ],
        child: MaterialApp(
          home: Scaffold(body: LatestScreen()),
        ));
  }
  Widget createWidgetUnderTest() {
    return ProviderScope(
        overrides: [
          latestRecipesNotifierProvider
              .overrideWith((ref) => LatestRecipesNotifier(mockUseCase))
        ],
        child: MaterialApp(
          home: Scaffold(body: LatestRecipeItemWidget(recipeItem: mockRecipesForTestingTable[0],)),
        ));
  }

  group('latest', () {


    testWidgets('Latest item test',
            (WidgetTester tester) async {
          getRecipesAfter2secondsDelay();
          await tester.pumpWidget(createWidgetUnderTest());
          await tester.pumpAndSettle();
          expect(find.text('title test'), findsOneWidget);
          expect(find.text('sumary test'), findsOneWidget);
          expect(find.textContaining('20 min', findRichText: true), findsOneWidget);
          expect(find.textContaining('2 ppl', findRichText: true), findsOneWidget);
          expect(find.byIcon(Icons.lock_clock), findsWidgets);
          expect(find.byIcon(Icons.fastfood), findsWidgets);
        });

  });
}
