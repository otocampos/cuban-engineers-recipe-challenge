import 'dart:io';

import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';

import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/inspirations_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRecipesUseCase  extends Mock implements GetRecipesUseCase {}

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });
  initAppModule();
  final mockUseCase = MockGetRecipesUseCase();
  final recipesNotifier = RecipesNotifier(mockUseCase);

  void getRecipesAfter2secondsDelay() {

    when(() => mockUseCase.execute(unit)).thenAnswer((_) async {
      return await Future.delayed(
          const Duration(seconds: 2), () => Right(mockedRecipes));
    });}
    Widget createWidgetUnderTest() {
      return ProviderScope(
          overrides: [
            recipesNotifierProvider
                .overrideWith((ref) { return recipesNotifier;})
          ],
          child: MaterialApp(
            home: Scaffold(body: InspirationsScreen()),
          ));
    }
  group('recipes', () {

    testWidgets('Recipes Inspirations screen Test', (WidgetTester tester) async{

      getRecipesAfter2secondsDelay();
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('Check'), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
     // expect(find.byKey(CircularProgressKey), findsOneWidget);
     await tester.pumpAndSettle();
      expect(find.byKey(CircularProgressKey), findsNothing);
      expect(find.text('title test'), findsOneWidget);
    });});


  }
