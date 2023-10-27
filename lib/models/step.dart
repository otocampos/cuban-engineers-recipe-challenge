import 'equipment.dart';
import 'ingredient.dart';

class StepRecipe {
  final int? number;
  final String? step;
  final List<Ingredient>? ingredients;
  final List<Equipment>? equipment;

  StepRecipe({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
  });

  factory StepRecipe.fromJson(Map<String, dynamic> json) {
    final ingredients =
    List<Ingredient>.from(json['ingredients'].map((item) => Ingredient.fromJson(item)));
    final equipment = List<Equipment>.from(json['equipment'].map((item) => Equipment.fromJson(item)));

    return StepRecipe(
      number: json['number'],
      step: json['step'],
      ingredients: ingredients,
      equipment: equipment,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'step': step,
      'ingredients': ingredients?.map((ingredient) => ingredient.toJson()).toList(),
      'equipment': equipment?.map((equip) => equip.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Step('
        'number: $number, '
        'step: $step, '
        'ingredients: $ingredients, '
        'equipment: $equipment)';
  }
}