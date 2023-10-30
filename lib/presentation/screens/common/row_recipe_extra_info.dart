import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeRowExtraInfo extends StatelessWidget {
  const RecipeRowExtraInfo({
    super.key,
    required this.recipeItem,
  });

  final dynamic recipeItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.lock_clock, size: 14),
              ),
                         TextSpan(
                  text: '${recipeItem.readyInMinutes} min',
                  style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        SizedBox(width: 8,),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.fastfood, size: 14),
              ),
              TextSpan(
                  text:  (recipeItem.servings > 1 )?'${recipeItem.servings} ppl':'${recipeItem.servings} pers',
                  style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}