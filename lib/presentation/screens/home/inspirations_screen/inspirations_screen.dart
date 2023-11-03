import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/browse_recipes.dart';
import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/recipes_list_widgets.dart';
import 'package:cuban_recipes/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/widgets_keys.dart';
import '../../../../models/recipe_item.dart';
import '../../../providers/provider.dart';

class InspirationsScreen extends ConsumerStatefulWidget {
  const InspirationsScreen({super.key});

  @override
  ConsumerState<InspirationsScreen> createState() => _InspirationsScreenState();
}

class _InspirationsScreenState extends ConsumerState<InspirationsScreen> {
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
        appBar: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(AppStrings.appBartTitle,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: Consumer(builder: (context, ref, child) {
          final recipesNotifier = ref.watch(recipesNotifierProvider);
          final List<RecipeItem> recipeList =
              recipesNotifier.recipesData.recipes;

          return recipesNotifier.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  key: ValueKey(CircularProgressKey),
                ))
              : Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Center(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(child: ListRecipes(recipeList)),
                        SliverToBoxAdapter(child: BrowseRecipes(recipeList)),
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 25),
                          child: Container(
                            height: 50,
                            child: OutlinedButton(
                                key: btnBrowseMore,
                                onPressed: () {},
                                child: Text(AppStrings.txtBtnBrowseMore)),
                          ),
                        )),
                      ],
                    ),
                  ),
                );
        }));
  }
}
