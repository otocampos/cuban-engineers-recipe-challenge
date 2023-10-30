import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../common/row_recipe_extra_info.dart';
import '../../../detail_recipe_screen.dart';

class LatestRecipeItemWidget extends StatelessWidget {
  const LatestRecipeItemWidget({
    super.key,
    required this.recipeItem,
  });

  final RecipeTable recipeItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RecipeItemScreen(id:recipeItem.id!,title:recipeItem.title!)),
        );
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Hero(
                  tag: '${recipeItem.id}',
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: recipeItem.image!,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 8),
              Text(recipeItem.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium),
              Text(recipeItem.summary!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall),
              Spacer(),
                 RecipeRowExtraInfo(recipeItem: recipeItem)

            ],
          ),
        ),
      ),
    );
  }
}


