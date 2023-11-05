import 'package:cuban_recipes/models/step.dart';

class AnalyzedInstructions {
  final List<StepRecipe>? steps;

  AnalyzedInstructions({
    this.steps,
  });

  factory AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    final steps = List<StepRecipe>.from(json['steps'].map((item) => StepRecipe.fromJson(item)));
    return AnalyzedInstructions(steps: steps);
  }

  Map<String, dynamic> toJson() {
    return {
      'steps': steps?.map((step) => step.toJson()).toList(),
    };
  }


}