class Ingredient {
  final int? id;
  final String? name;
  final String? image;

  Ingredient({
    this.id,
    this.name,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Ingredient('
        'id: $id, '
        'name: $name, '
        'image: $image)';
  }
}