import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../../models/recipe_item.dart';

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({
    super.key,
    required this.recipeItem,
  });

  final RecipeItem recipeItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipeItem.title!,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: recipeItem.image!,
                  // Altura desejada
                  fit: BoxFit
                      .cover // Ajuste a escala da imagem conforme necessário
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
