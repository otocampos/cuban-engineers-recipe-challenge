class Equipment {
  final int? id;
  final String? name;
  final String? image;

  Equipment({
    this.id,
    this.name,
    this.image,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
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
    return 'Equipment('
        'id: $id, '
        'name: $name, '
        'image: $image)';
  }
}