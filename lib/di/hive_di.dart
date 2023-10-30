
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../database/models/analyzed_instructions_table.dart';
import '../database/models/recipe_table.dart';
import '../database/models/step_table.dart';
final instance = GetIt.instance;
Future<void> initHiveModule() async {
await Hive.initFlutter();
instance.registerSingleton<HiveInterface>(Hive);
Hive.registerAdapter<RecipeTable>(RecipeTableAdapter());
Hive.registerAdapter<AnalyzedInstructionsTable>(AnalyzedInstructionsTableAdapter());
Hive.registerAdapter<StepTable>(StepTableAdapter());
}