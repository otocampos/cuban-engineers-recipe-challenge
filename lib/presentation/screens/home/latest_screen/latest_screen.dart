import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:cuban_recipes/presentation/screens/home/latest_screen/widgets/latest_recite_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LatestScreen extends ConsumerStatefulWidget {
  const LatestScreen({super.key});

  @override
  ConsumerState<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends ConsumerState<LatestScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(latestRecipesNotifierProvider).getRecipes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final latestRecipesNotifier = ref.watch(latestRecipesNotifierProvider);
      dynamic recipeList = latestRecipesNotifier.latestRecipesData;

      print(recipeList.length.toString());
      return recipeList.isEmpty
          ? Center(
              key: screenLatest,
              child: Text('No recipes yet '),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  tileBottomSpace: 10,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 1,
                  pattern: [
                    WovenGridTile(
                      5 / 8,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    WovenGridTile(
                      5 / 9,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.topCenter,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    RecipeTable item = recipeList[index];
                    return LatestRecipeItemWidget(recipeItem: item);
                  },
                  childCount: recipeList.length,
                ),
              ),
            );
    }));
  }
}
