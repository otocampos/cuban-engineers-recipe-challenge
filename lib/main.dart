import 'package:cuban_recipes/constants/screen_routes.dart';
import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/domain/use_cases/get_recipes_use_case.dart';
import 'package:cuban_recipes/presentation/screens/home/home_screen.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/recipes_list_widgets.dart';
import 'package:cuban_recipes/presentation/screens/intro_screen.dart';
import 'package:cuban_recipes/data/repository/recipes_data.dart';
import 'package:cuban_recipes/themes/main_theme.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/app_context.dart';
void main() async{
  initAppModule();
  runApp(const ProviderScope(child: RecipeApp()));

}

class RecipeApp extends StatelessWidget {

  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes:{
        ScreenRoutes.INTRO_SCREEN: (context) => IntroScreen(),
        ScreenRoutes.HOME_SCREEN: (context) => IntroScreen(),
      } ,
    );
  }
}