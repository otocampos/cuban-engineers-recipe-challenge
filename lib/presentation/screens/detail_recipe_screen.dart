import 'package:cuban_recipes/models/step.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/recipe_item.dart';


class RecipeItemScreen extends ConsumerStatefulWidget {
  const RecipeItemScreen({super.key, required this.id});

  final int id;

  @override
  ConsumerState<RecipeItemScreen> createState() => _RecipeItemScreenState();
}

class _RecipeItemScreenState extends ConsumerState<RecipeItemScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(recipeByIdNotifierProvider).getRecipeById(widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final recipeNotifier = ref.watch(recipeByIdNotifierProvider);
          RecipeItem recipeItem = recipeNotifier.recipesData;
          List<StepRecipe>? steps = recipeItem.analyzedInstructions?[0].steps;
          return recipeNotifier.isLoading
              ? const Center(
              child: CircularProgressIndicator(
                key: ValueKey('loginCircularProgressKey'),
              ))
              :
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    "teste",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:
                    PageView.builder(
                      itemCount: steps?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "teste",
                                style: TextStyle(fontSize: 24.0),
                              ),
                              Text(
                                "teste",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                )
            ],
          );
        },
      ),
    );
  }
}
