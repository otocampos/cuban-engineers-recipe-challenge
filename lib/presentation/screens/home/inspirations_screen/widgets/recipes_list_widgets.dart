import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/first_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../notifiers/recipes_notifier.dart';
import '../../../../providers/provider.dart';
class ListRecipes extends StatelessWidget {
  const ListRecipes(List<RecipeItem> this.recipes);
  final List<RecipeItem> recipes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           recipes.isEmpty ?Container()  :FirstGridItem(recipeItem: recipes.first),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16),
              child: Column(
                children: [
                  SecondtyItem(
                      height: 0.3,
                      title: 'Cook',
                      desc: 'Thermomix advanced tips and tricks',
                      subTitle: 'like pro'),
                  SecondtyItem(
                      height: 0.2, title: 'Check', subTitle: 'new updates'),
                ],
              ),
            )
          ],
        ));
  }
}



class SecondtyItem extends StatelessWidget {
  num height;
  String title;
  String subTitle;
  String? desc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineLarge),
              Text(subTitle,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      )),
              SizedBox(
                height: 25,
              ),
              desc == null
                  ? Container()
                  : Text(desc!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  SecondtyItem(
      {required this.height,
      required this.title,
      required this.subTitle,
      this.desc});
}
