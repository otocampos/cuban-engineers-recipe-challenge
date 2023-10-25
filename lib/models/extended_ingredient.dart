import 'measures.dart';

class ExtendedIngredient {
  final int? id;
  final String? aisle;
  final String? image;
  final String? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final double? amount;
  final String? unit;
  final List<String>? meta;
  final Measures? measures;

  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredient(
      id: json['id'],
      aisle: json['aisle'],
      image: json['image'],
      consistency: json['consistency'],
      name: json['name'],
      nameClean: json['nameClean'],
      original: json['original'],
      originalName: json['originalName'],
      amount: json['amount'],
      unit: json['unit'],
      meta: List<String>.from(json['meta'].map((item) => item)),
      measures: Measures.fromJson(json['measures']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aisle': aisle,
      'image': image,
      'consistency': consistency,
      'name': name,
      'nameClean': nameClean,
      'original': original,
      'originalName': originalName,
      'amount': amount,
      'unit': unit,
      'meta': meta,
      'measures': measures?.toJson(),
    };
  }

  @override
  String toString() {
    return 'ExtendedIngredient('
        'id: $id, '
        'aisle: $aisle, '
        'image: $image, '
        'consistency: $consistency, '
        'name: $name, '
        'nameClean: $nameClean, '
        'original: $original, '
        'originalName: $originalName, '
        'amount: $amount, '
        'unit: $unit, '
        'meta: $meta, '
        'measures: $measures)';
  }
}