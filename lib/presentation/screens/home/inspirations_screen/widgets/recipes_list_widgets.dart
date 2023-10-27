import 'package:cuban_recipes/models/recipe_item.dart';
import 'package:cuban_recipes/models/recipes.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/first_grid_item.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../notifiers/recipes_notifier.dart';
import '../../../../providers/provider.dart';

class ListRecipes extends ConsumerStatefulWidget {
  const ListRecipes({super.key});

  @override
  ConsumerState<ListRecipes> createState() => _ListRecipesState();
}

class _ListRecipesState extends ConsumerState<ListRecipes> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(recipesNotifierProvider).getRecipes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final quotesNotifier = ref.watch(recipesNotifierProvider);
          List<RecipeItem> recipeList = quotesNotifier.recipesData.recipes;

          return quotesNotifier.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  key: ValueKey('loginCircularProgressKey'),
                ))
              : CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverToBoxAdapter(
                    child: FirstGridItem(recipeItem: recipeList.first),
                    ),
                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing:
                            1,
                        crossAxisSpacing:
                            1,
                        childAspectRatio: 1.0,
                        crossAxisCount: 2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final RecipeItem quote = recipeList[++index];
                          return RecipeItemWidget(recipeItem: quote);
                        },
                        childCount:
                            quotesNotifier.recipesData.recipes.length - 1,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
