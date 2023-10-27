import 'analyzed_instructions.dart';
import 'extended_ingredient.dart';

class RecipeItem {
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final int? weightWatcherSmartPoints;
  final String? gaps;
  final int? preparationMinutes;
  final int? cookingMinutes;
  final int? aggregateLikes;
  final int? healthScore;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final double? pricePerServing;
  final List<ExtendedIngredient>? extendedIngredients;
  final int? id;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final String? image;
  final String? imageType;
  final String? summary;
  final List<String>? cuisines;
  final List<String>? dishTypes;
  final List<String>? diets;
  final List<String>? occasions;
  final String? instructions;
  final List<AnalyzedInstructions>? analyzedInstructions;
  final int? originalId;
  final String? spoonacularSourceUrl;

  RecipeItem({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    required this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });

  factory RecipeItem.fromJson(Map<String, dynamic> json) {
    final extendedIngredients = List<ExtendedIngredient>.from(
        json['extendedIngredients'].map((item) => ExtendedIngredient.fromJson(item)));
    final cuisines = List<String>.from(json['cuisines'].map((item) => item));
    final dishTypes = List<String>.from(json['dishTypes'].map((item) => item));
    final diets = List<String>.from(json['diets'].map((item) => item));
    final occasions = List<String>.from(json['occasions'].map((item) => item));
    final analyzedInstructions = List<AnalyzedInstructions>.from(
        json['analyzedInstructions'].map((item) => AnalyzedInstructions.fromJson(item)));

    return RecipeItem(
      vegetarian: json['vegetarian'],
      vegan: json['vegan'],
      glutenFree: json['glutenFree'],
      dairyFree: json['dairyFree'],
      veryHealthy: json['veryHealthy'],
      cheap: json['cheap'],
      veryPopular: json['veryPopular'],
      sustainable: json['sustainable'],
      lowFodmap: json['lowFodmap'],
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'],
      gaps: json['gaps'],
      preparationMinutes: json['preparationMinutes'],
      cookingMinutes: json['cookingMinutes'],
      aggregateLikes: json['aggregateLikes'],
      healthScore: json['healthScore'],
      creditsText: json['creditsText'],
      license: json['license'],
      sourceName: json['sourceName'],
      pricePerServing: json['pricePerServing'],
      extendedIngredients: extendedIngredients,
      id: json['id'],
      title: json['title'],
      readyInMinutes: json['readyInMinutes'],
      servings: json['servings'],
      sourceUrl: json['sourceUrl'],
      image: json['image'],
      imageType: json['imageType'],
      summary: json['summary'],
      cuisines: cuisines,
      dishTypes: dishTypes,
      diets: diets,
      occasions: occasions,
      instructions: json['instructions'],
      analyzedInstructions: analyzedInstructions,
      originalId: json['originalId'],
      spoonacularSourceUrl: json['spoonacularSourceUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vegetarian': vegetarian,
      'vegan': vegan,
      'glutenFree': glutenFree,
      'dairyFree': dairyFree,
      'veryHealthy': veryHealthy,
      'cheap': cheap,
      'veryPopular': veryPopular,
      'sustainable': sustainable,
      'lowFodmap': lowFodmap,
      'weightWatcherSmartPoints': weightWatcherSmartPoints,
      'gaps': gaps,
      'preparationMinutes': preparationMinutes,
      'cookingMinutes': cookingMinutes,
      'aggregateLikes': aggregateLikes,
      'healthScore': healthScore,
      'creditsText': creditsText,
      'license': license,
      'sourceName': sourceName,
      'pricePerServing': pricePerServing,
      'extendedIngredients': extendedIngredients?.map((ingredient) => ingredient.toJson()).toList(),
      'id': id,
      'title': title,
      'readyInMinutes': readyInMinutes,
      'servings': servings,
      'sourceUrl': sourceUrl,
      'image': image,
      'imageType': imageType,
      'summary': summary,
      'cuisines': cuisines,
      'dishTypes': dishTypes,
      'diets': diets,
      'occasions': occasions,
      'instructions': instructions,
      'analyzedInstructions': analyzedInstructions?.map((instruction) => instruction.toJson()).toList(),
      'originalId': originalId,
      'spoonacularSourceUrl': spoonacularSourceUrl,
    };
  }

  @override
  String toString() {
    return 'RecipeItem('
        'vegetarian: $vegetarian, '
        'vegan: $vegan, '
        'glutenFree: $glutenFree, '
        'dairyFree: $dairyFree, '
        'veryHealthy: $veryHealthy, '
        'cheap: $cheap, '
        'veryPopular: $veryPopular, '
        'sustainable: $sustainable, '
        'lowFodmap: $lowFodmap, '
        'weightWatcherSmartPoints: $weightWatcherSmartPoints, '
        'gaps: $gaps, '
        'preparationMinutes: $preparationMinutes, '
        'cookingMinutes: $cookingMinutes, '
        'aggregateLikes: $aggregateLikes, '
        'healthScore: $healthScore, '
        'creditsText: $creditsText, '
        'license: $license, '
        'sourceName: $sourceName, '
        'pricePerServing: $pricePerServing, '
        'extendedIngredients: $extendedIngredients, '
        'id: $id, '
        'title: $title, '
        'readyInMinutes: $readyInMinutes, '
        'servings: $servings, '
        'sourceUrl: $sourceUrl, '
        'image: $image, '
        'imageType: $imageType, '
        'summary: $summary, '
        'cuisines: $cuisines, '
        'dishTypes: $dishTypes, '
        'diets: $diets, '
        'occasions: $occasions, '
        'instructions: $instructions, '
        'analyzedInstructions: $analyzedInstructions, '
        'originalId: $originalId, '
        'spoonacularSourceUrl: $spoonacularSourceUrl)';
  }
}