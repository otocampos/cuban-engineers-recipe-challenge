import 'package:cuban_recipes/database/models/recipe_table.dart';
import 'package:hive/hive.dart';
part 'step_table.g.dart';

@HiveType(typeId: 3)
class StepTable {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? step;

  StepTable({
    this.number,
    this.step,
  });
}
