import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/constants/screen_routes.dart';
import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:cuban_recipes/presentation/screens/home/home_screen.dart';
import 'package:cuban_recipes/presentation/screens/intro_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipesService extends Mock implements GetRecipesUseCase {}
void main() {
  initAppModule();
  testWidgets('Intro Screen', (WidgetTester tester) async {
    MockRecipesService mockRecipesService = MockRecipesService();

    await tester.pumpWidget(ProviderScope(
        overrides: [
          recipesNotifierProvider
              .overrideWith((ref) => RecipesNotifier(mockRecipesService)),
        ],
        child: MaterialApp(
      home: IntroScreen(),
      routes: {
        ScreenRoutes.HOME_SCREEN: (context) => HomeScreen(),
      },
    )));

    when(() => mockRecipesService.execute(unit))
        .thenAnswer((_) async =>Right(mockedRecipes) );


    final appBarTitle = find.byKey(appBarTitleKey);
    final appBar = find.byKey(appBarKey);
    final titleText = find.byKey(titleIntroKey);
    final subTitleText = find.byKey(subTitleIntroKey);
    final btnText = find.byKey(btnTitleIntroKey);
    final btnWidget = find.byKey(btnIntroKey);

    expect(appBar, findsOneWidget);
    expect(appBarTitle, findsOneWidget);
    expect(titleText, findsOneWidget);
    expect(subTitleText, findsOneWidget);
    expect(btnText, findsOneWidget);
    expect(btnWidget, findsOneWidget);



  });
}
