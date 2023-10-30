import 'dart:ui';

import 'package:cuban_recipes/presentation/screens/detail_recipe_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/widgets_keys.dart';
import '../../../../../models/recipe_item.dart';
import '../../../common/row_recipe_extra_info.dart';

class BrowseRecipeItem extends StatelessWidget {
  const BrowseRecipeItem({
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
            MaterialPageRoute(builder: (context) =>  RecipeItemScreen(id:recipeItem.id!, title: recipeItem.title!,)),
          );
        },
        child:  Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('${recipeItem.sourceName}',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text("recommend you",
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Hero(
                            tag: '${recipeItem.id}',
                            child: Image.network(
                              recipeItem.image!,
                              fit: BoxFit
                                  .fitHeight,
                            ),
                          ),
                        ),
                          SizedBox(height: 16,),
                          Text(recipeItem.title!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium),
                          SizedBox(height: 16),

                          Text(recipeItem.summary!,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(height: 16),
                          RecipeRowExtraInfo(recipeItem: recipeItem),

                        ],
                      ),

                  ),
                ),

              ],
            ),
          ),

      ),
    );
  }
}
