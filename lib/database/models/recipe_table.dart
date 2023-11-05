import 'package:hive/hive.dart';

import 'analyzed_instructions_table.dart';
part 'recipe_table.g.dart';

@HiveType(typeId: 1)
class RecipeTable{
  @HiveField(0)
  final String? creditsText;
  @HiveField(1)
  final String? license;
  @HiveField(2)
  final String? sourceName;
  @HiveField(3)
  final double? pricePerServing;
  @HiveField(4)
  final int? id;
  @HiveField(5)
  final String? title;
  @HiveField(6)
  final int? readyInMinutes;
  @HiveField(7)
  final int? servings;
  @HiveField(8)
  final String? sourceUrl;
  @HiveField(9)
  final String? image;
  @HiveField(10)
  final String? imageType;
  @HiveField(11)
  final String? summary;
  @HiveField(12)
  final String? instructions;
  @HiveField(13)
  final int? originalId;
  @HiveField(14)
  final List<AnalyzedInstructionsTable>? analyzedInstructions;
  @HiveField(15)
  final String? spoonacularSourceUrl;

  RecipeTable({
    this.analyzedInstructions,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.instructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });
}