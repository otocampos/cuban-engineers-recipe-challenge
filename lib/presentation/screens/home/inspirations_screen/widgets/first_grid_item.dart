import 'dart:ui';

import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/presentation/screens/detail_recipe_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../models/recipe_item.dart';
import '../../../common/row_recipe_extra_info.dart';

class FirstGridItem extends StatelessWidget {
  const FirstGridItem({
    super.key,
    required this.recipeItem,
  });

  final RecipeItem recipeItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  RecipeItemScreen(id:recipeItem.id!,title:recipeItem.title!)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Recipe", style: Theme.of(context).textTheme.headlineLarge),
                      Text("of the Day", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight:FontWeight.normal ,color: Colors.grey,
                      )),

                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(recipeItem.title!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: 5,
                  ),
                  RecipeRowExtraInfo(recipeItem: recipeItem),
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Hero(
                      tag: '${recipeItem.id}',
                      child: Image.network(
                        recipeItem.image!,
                        // Altura desejada
                        fit: BoxFit
                            .fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
