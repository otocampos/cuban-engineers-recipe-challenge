import 'dart:io';

import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';

import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/inspirations_screen.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/first_grid_item.dart';
import 'package:cuban_recipes/utils/strings_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRecipesUseCase extends Mock implements GetRecipesUseCase {}

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });
  initAppModule();
  testWidgets('Inspirations Screen', InspirationsWidgetTest);



}
Future<void>InspirationsWidgetTest(WidgetTester tester)async{
  final mockUseCase = MockGetRecipesUseCase();

  void getRecipesAfter2secondsDelay() {
    when(() => mockUseCase.execute(unit)).thenAnswer((_) async {
      return await Future.delayed(
          const Duration(seconds: 2), () => Right(mockedRecipes));
    });
  }

  Widget createWidgetUnderTest() {
    return ProviderScope(
        overrides: [
          recipesNotifierProvider
              .overrideWith((ref) => RecipesNotifier(mockUseCase))
        ],
        child: MaterialApp(
          home: Scaffold(body: InspirationsScreen()),
        ));
  }
  getRecipesAfter2secondsDelay();
  await tester.pumpWidget(createWidgetUnderTest());
  expect(find.byKey(btnBrowseMore), findsWidgets);

  await tester.pumpAndSettle();
  expect(find.text('title test'), findsOneWidget);

  //   expect(find.byWidget(TextSpan(),'2 ppl'), findsWidgets);
  expect(find.text('Recipe'), findsWidgets);
  expect(find.text('of the Day'), findsWidgets);
  expect(find.textContaining('20 min', findRichText: true), findsOneWidget);
  expect(find.textContaining('2 ppl', findRichText: true), findsOneWidget);
  expect(find.byIcon(Icons.lock_clock), findsWidgets);
  expect(find.byIcon(Icons.fastfood), findsWidgets);

  expect(find.text('Cook'), findsOneWidget);
  expect(find.text('like pro'), findsOneWidget);
  expect(find.text('Thermomix advanced tips and tricks'), findsOneWidget);
  expect(find.text('Check'), findsOneWidget);
  expect(find.text('new updates'), findsOneWidget);

  expect(find.text('recommend you'), findsOneWidget);
  expect(find.text('title test 2'), findsOneWidget);
  expect(find.text('sumary test 2'), findsOneWidget);
  expect(find.text('Anne'), findsOneWidget);
  expect(find.byIcon(Icons.lock_clock), findsWidgets);
  expect(find.byIcon(Icons.fastfood), findsWidgets);
  expect(find.textContaining('3 ppl', findRichText: true), findsOneWidget);
  expect(find.textContaining('30 min', findRichText: true), findsOneWidget);
}
