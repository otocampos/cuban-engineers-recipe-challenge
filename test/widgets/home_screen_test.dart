import 'dart:io';

import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';

import 'package:cuban_recipes/presentation/notifiers/recipes_notifier.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:cuban_recipes/presentation/screens/home/home_screen.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/inspirations_screen.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/first_grid_item.dart';
import 'package:cuban_recipes/utils/strings_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });
  initAppModule();
  testWidgets("Home Screen Test", HomeWidgetTest);
}

Future<void> HomeWidgetTest(WidgetTester tester) async {
  Widget createWidgetUnderTest() {
    return ProviderScope(

        child: MaterialApp(
      home: Scaffold(body: HomeScreen()),
    ));
  }

  await tester.pumpWidget(createWidgetUnderTest());

  await tester.pumpAndSettle();
  expect(find.text(AppStrings.bottomBarInspirations), findsOneWidget);
  expect(find.text(AppStrings.bottomBarLatest), findsOneWidget);
  expect(find.text(AppStrings.appBartTitle), findsOneWidget);
}
