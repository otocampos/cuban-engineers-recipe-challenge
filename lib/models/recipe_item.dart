
import 'analyzed_instructions.dart';

class RecipeItem {




  final String? creditsText;
  final String? license;
  final String? sourceName;
  final double? pricePerServing;
  final int? id;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;
  final String? image;
  final String? imageType;
  final String? summary;
  final String? instructions;
  final List<AnalyzedInstructions>? analyzedInstructions;
  final int? originalId;
  final String? spoonacularSourceUrl;

  RecipeItem({
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
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });

  factory RecipeItem.fromJson(Map<String, dynamic> json) {
    final analyzedInstructions = List<AnalyzedInstructions>.from(
        json['analyzedInstructions'].map((item) => AnalyzedInstructions.fromJson(item)));

    return RecipeItem(
      creditsText: json['creditsText'] ??'',
      license: json['license']??'',
      sourceName: json['sourceName']??'',
      pricePerServing: json['pricePerServing']??'',
      id: json['id']??'',
      title: json['title']??'',
      readyInMinutes: json['readyInMinutes']??'',
      servings: json['servings']??'',
      sourceUrl: json['sourceUrl']??'',
      image: json['image']??'https://placehold.co/100x100',
      imageType: json['imageType']??'',
      summary: json['summary']??'',
      instructions: json['instructions']??'',
      analyzedInstructions: analyzedInstructions,
      originalId: json['originalId']??0,
      spoonacularSourceUrl: json['spoonacularSourceUrl']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'creditsText': creditsText,
      'license': license,
      'sourceName': sourceName,
      'pricePerServing': pricePerServing,
      'id': id,
      'title': title,
      'readyInMinutes': readyInMinutes,
      'servings': servings,
      'sourceUrl': sourceUrl,
      'image': image,
      'imageType': imageType,
      'summary': summary,
      'instructions': instructions,
      'analyzedInstructions': analyzedInstructions?.map((instruction) => instruction.toJson()).toList(),
      'originalId': originalId,
      'spoonacularSourceUrl': spoonacularSourceUrl,
    };
  }

  @override
  String toString() {
    return 'RecipeItem('
        'creditsText: $creditsText, '
        'license: $license, '
        'sourceName: $sourceName, '
        'pricePerServing: $pricePerServing, '
        'id: $id, '
        'title: $title, '
        'readyInMinutes: $readyInMinutes, '
        'servings: $servings, '
        'sourceUrl: $sourceUrl, '
        'image: $image, '
        'imageType: $imageType, '
        'summary: $summary, '
        'instructions: $instructions, '
        'analyzedInstructions: $analyzedInstructions, '
        'originalId: $originalId, '
        'spoonacularSourceUrl: $spoonacularSourceUrl)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeItem &&
          runtimeType == other.runtimeType &&
          creditsText == other.creditsText &&
          license == other.license &&
          sourceName == other.sourceName &&
          pricePerServing == other.pricePerServing &&
          id == other.id &&
          title == other.title &&
          readyInMinutes == other.readyInMinutes &&
          servings == other.servings &&
          sourceUrl == other.sourceUrl &&
          image == other.image &&
          imageType == other.imageType &&
          summary == other.summary &&
          instructions == other.instructions &&
          analyzedInstructions == other.analyzedInstructions &&
          originalId == other.originalId &&
          spoonacularSourceUrl == other.spoonacularSourceUrl;

  @override
  int get hashCode =>
      creditsText.hashCode ^
      license.hashCode ^
      sourceName.hashCode ^
      pricePerServing.hashCode ^
      id.hashCode ^
      title.hashCode ^
      readyInMinutes.hashCode ^
      servings.hashCode ^
      sourceUrl.hashCode ^
      image.hashCode ^
      imageType.hashCode ^
      summary.hashCode ^
      instructions.hashCode ^
      analyzedInstructions.hashCode ^
      originalId.hashCode ^
      spoonacularSourceUrl.hashCode;
}