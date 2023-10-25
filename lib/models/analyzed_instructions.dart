import 'package:cuban_recipes/models/step.dart';

class AnalyzedInstructions {
  final List<Step>? steps;

  AnalyzedInstructions({
    this.steps,
  });

  factory AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    final steps = List<Step>.from(json['steps'].map((item) => Step.fromJson(item)));
    return AnalyzedInstructions(steps: steps);
  }

  Map<String, dynamic> toJson() {
    return {
      'steps': steps?.map((step) => step.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'AnalyzedInstructions(steps: $steps)';
  }
}