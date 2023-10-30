
import '../../database/models/step_table.dart';
import '../../models/step.dart';

class StepRecipeDioHiveAdapter{
  static StepTable convert(StepRecipe stepRecipe) {
    return StepTable(
      number: stepRecipe.number,
      step: stepRecipe.step,
    );
  }

  static List<StepTable> convertList(List<StepRecipe>? steps) {
    if (steps == null) return [];

    List<StepTable> stepTables = [];
    for (var step in steps) {
      stepTables.add(convert(step));
    }
    return stepTables;
  }
}