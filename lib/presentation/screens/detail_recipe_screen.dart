import 'package:cuban_recipes/constants/widgets_keys.dart';
import 'package:cuban_recipes/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/recipe_item.dart';

class RecipeItemScreen extends ConsumerStatefulWidget {
  const RecipeItemScreen({super.key, required this.id, required this.title});

  final String title;
  final int id;

  @override
  ConsumerState<RecipeItemScreen> createState() => _RecipeItemScreenState();
}

class _RecipeItemScreenState extends ConsumerState<RecipeItemScreen> {
  var heroTag;

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
      appBar: AppBar(title: Text(widget.title)),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final recipeNotifier = ref.watch(recipeByIdNotifierProvider);
          dynamic recipeItem = recipeNotifier.recipesData;
          heroTag = recipeItem.id;
          List<dynamic>? steps = recipeItem.analyzedInstructions?[0].steps;
          return recipeNotifier.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  key: ValueKey(CircularProgressKey),
                ))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: Hero(
                        tag: '${heroTag}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.network(
                            recipeItem.image ?? "https://placehold.co/100x100",
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 16,),),
                    SliverToBoxAdapter(
                        child: Text(recipeItem.title.toString(),
                            style: Theme.of(context).textTheme.titleLarge)),
                    SliverToBoxAdapter(child: SizedBox(height: 16,),),
                    SliverToBoxAdapter(
                        child: Text(
                            'Redy in: ${recipeItem.readyInMinutes.toString()} minutes',style: Theme.of(context).textTheme.titleSmall)),
                    SliverToBoxAdapter(child: SizedBox(height: 16,),),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 250,
                        child: PageView.builder(
                          pageSnapping: true,
                          itemCount: steps?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Step ${steps?[index].number.toString()}' ??
                                            '',
                                        style: TextStyle(fontSize: 24.0),
                                      ),
                                    ),
                                    SizedBox(height: 16,),
                                    Flexible(
                                      child: Scrollbar(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            steps?[index].step.toString() ?? '',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
                );
        },
      ),
    );
  }
}
