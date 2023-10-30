import 'package:cuban_recipes/database/models/step_table.dart';
import 'package:hive/hive.dart';
part 'analyzed_instructions_table.g.dart';

@HiveType(typeId: 2)
class AnalyzedInstructionsTable {
  @HiveField(0)
  final List<StepTable>? steps;

  AnalyzedInstructionsTable({
    this.steps,
  }) ;
}