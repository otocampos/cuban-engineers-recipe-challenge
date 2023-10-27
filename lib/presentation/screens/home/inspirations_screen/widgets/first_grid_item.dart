import 'dart:ui';

import 'package:cuban_recipes/presentation/screens/detail_recipe_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../models/recipe_item.dart';

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
            MaterialPageRoute(builder: (context) =>  RecipeItemScreen(id:recipeItem.id!)),
          );
        },
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text("Recipe",
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text("of the Day",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(recipeItem.title!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.lock_clock, size: 14),
                          ),
                          TextSpan(
                              text: '${recipeItem.preparationMinutes} min',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    recipeItem.image!,
                    // Altura desejada
                    fit: BoxFit
                        .fitHeight, // Ajuste a escala da imagem conforme necessário
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
