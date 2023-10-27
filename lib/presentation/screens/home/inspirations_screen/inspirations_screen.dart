import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/widgets/recipes_list_widgets.dart';
import 'package:flutter/material.dart';

class InspirationsScreen extends StatelessWidget {
  const InspirationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Cooksy'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(child: FractionallySizedBox(heightFactor:0.5,child: ListRecipes()),),
      )
    );
  }
}
