import 'package:cuban_recipes/data/adapters/steps_dio_hive_adapter.dart';

import '../../database/models/analyzed_instructions_table.dart';
import '../../models/analyzed_instructions.dart';

class AnalyzedInstructionsDioHiveAdapter {
  static AnalyzedInstructionsTable convert(
      AnalyzedInstructions analyzedInstructions) {
    return AnalyzedInstructionsTable(
      steps: StepRecipeDioHiveAdapter.convertList(analyzedInstructions.steps),
    );
  }

  static List<AnalyzedInstructionsTable> convertList(
      List<AnalyzedInstructions>? instructions) {
    if (instructions == null) return [];

    List<AnalyzedInstructionsTable> instructionsTables = [];
    for (var instruction in instructions) {
      instructionsTables.add(convert(instruction));
    }
    return instructionsTables;
  }
}
